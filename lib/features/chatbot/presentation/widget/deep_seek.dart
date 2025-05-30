

import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class DeepSeekService {
  final String apiKey = dotenv.env['API_KEY'] ?? 'fallback_key_or_error';
  final String apiUrl = 'https://openrouter.ai/api/v1/chat/completions';

  // Stream<String> streamResponse(String prompt) async* {
  //   try {
  //     final request = http.Request('POST', Uri.parse(apiUrl))
  //       ..headers.addAll({
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $apiKey',
  //       })
  //       ..body = jsonEncode({
  //         "model": "deepseek/deepseek-chat:free",
  //         "messages": [{"role": "user", "content": prompt}],
  //         "stream": true,
  //       });
  //
  //     final response = await http.Client().send(request);
  //     String buffer = "";
  //
  //     if (response.statusCode == 200) {
  //       await for (var chunk in response.stream.transform(utf8.decoder)) {
  //         buffer += chunk;
  //         List<String> messages = buffer.split("\n");
  //         buffer = ""; // Reset buffer
  //
  //         for (var message in messages) {
  //           if (message.startsWith("data: ")) {
  //             message = message.replaceFirst("data: ", "").trim();
  //           }
  //
  //           if (message.isNotEmpty && message != "[DONE]") {
  //             try {
  //               final jsonResponse = jsonDecode(message);
  //               final content = jsonResponse["choices"]?[0]?["delta"]?["content"] ?? "";
  //
  //               if (content.isNotEmpty) {
  //                 // Ensure response is well-formatted
  //                 yield _formatResponse(content);
  //               }
  //             } catch (e) {
  //               print("JSON Parsing Error: $e \n Raw Response: $message");
  //             }
  //           }
  //         }
  //       }
  //     } else {
  //       yield '⚠️ Error: ${response.statusCode} - ${await response.stream.bytesToString()}';
  //     }
  //   } catch (e) {
  //     yield '⚠️ Error: $e';
  //   }
  // }
  Stream<String> streamResponse(String prompt) async* {
    try {
      final request = http.Request('POST', Uri.parse(apiUrl))
        ..headers.addAll({
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
          'Accept': 'text/event-stream', // Important for streaming
        })
        ..body = jsonEncode({
          "model": "deepseek/deepseek-chat:free",
          "messages": [
            {"role": "user", "content": prompt}
          ],
          "stream": true,
        });

      final response = await http.Client().send(request);
      String buffer = "";

      if (response.statusCode == 200) {
        final stream = response.stream
            .transform(utf8.decoder)
            .transform(const LineSplitter());

        await for (var line in stream) {
          line = line.trim();

          if (line.isEmpty || line.startsWith(":")) {
            continue; // Skip empty lines or comments
          }

          if (line.startsWith("data: ")) {
            final jsonString = line.substring(6).trim();

            if (jsonString == "[DONE]") break;

            try {
              final jsonResponse = jsonDecode(jsonString);
              final content = jsonResponse["choices"]?[0]?["delta"]?["content"] ?? "";

              if (content.isNotEmpty) {
                yield content;
              }
            } catch (e) {
              print("JSON Parsing Error: $e\nRaw line: $line");
            }
          }
        }
      } else {
        final errorBody = await response.stream.bytesToString();
        yield '⚠️ Error: ${response.statusCode} - $errorBody';
      }
    } catch (e) {
      yield '⚠️ Error: $e';
    }
  }




  Future<String> analyzeFile(String content) async {
    // Ensure content is properly encoded as UTF-8
    final utf8Content = content;

    final String prompt = """
You are a helpful AI assistant. The user has uploaded a file with the following content:

$utf8Content

🎯 Your task:
- Analyze the file content and provide a comprehensive analysis.
- Format the output clearly, using headings, bullet points, and emojis for clarity.
- Avoid irrelevant information and focus on key insights.

Respond in a structured format.
""";

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json; charset=utf-8', // Explicit UTF-8 charset
          'Authorization': 'Bearer $apiKey',
        },
        body: utf8.encode(jsonEncode({ // Explicit UTF-8 encoding
          "model": "deepseek/deepseek-chat:free",
          "messages": [
            {"role": "user", "content": prompt}
          ],
        })),
      );

      if (response.statusCode == 200) {
        // Decode response body as UTF-8
        final jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
        String result = jsonResponse["choices"][0]["message"]["content"] ?? "No response";

        return _formatResponse(result);
      } else {
        // Include the response body in the error for debugging
        final errorBody = utf8.decode(response.bodyBytes);
        throw Exception('⚠️ Failed to analyze file. Status: ${response.statusCode}. Body: $errorBody');
      }
    } catch (e) {
      throw Exception('⚠️ Error analyzing file: $e');
    }
  }







  generateSuggestedCoursesMessage(
      List<String> courses,
      void Function(List<String> titles) onTitlesExtracted, // Callback to return titles
      ) async* {
    if (courses.isEmpty) {
      yield "I couldn't find any course recommendations.";
      onTitlesExtracted([]);
      return;
    }

    final String prompt = """
You are a helpful AI assistant. The user has received the following course recommendations:

${courses.map((course) => "- $course").join("\n")}

🎯 Your job:
- For each course, search for a real online course and include courses from the following sources (freeCodeCamp,MIT OpenCourseWare,freeCodeCamp YouTube,Programming with Mosh,Tech with Tim) .
- Include a real clickable link for each.
- Format clearly using markdown: **[Course Name](https://link.com)** and make sure it is still supported
- Use headings, bullet points, and emojis where helpful to make it friendly and readable.
- Only use real links – do not make up URLs.

Respond in a structured format.
""";

    final request = http.Request('POST', Uri.parse(apiUrl))
      ..headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
        'Accept': 'text/event-stream',
      })
      ..body = jsonEncode({
        "model": "deepseek/deepseek-chat:free",
        "messages": [
          {"role": "user", "content": prompt}
        ],
        "stream": true,
      });

    final response = await http.Client().send(request);
    final buffer = StringBuffer();

    if (response.statusCode == 200) {
      final stream = response.stream
          .transform(utf8.decoder)
          .transform(const LineSplitter());

      await for (var line in stream) {
        line = line.trim();

        if (line.isEmpty || line.startsWith(":")) continue;

        if (line.startsWith("data: ")) {
          final jsonString = line.substring(6).trim();

          if (jsonString == "[DONE]") break;

          try {
            final jsonResponse = jsonDecode(jsonString);
            final content = jsonResponse["choices"]?[0]?["delta"]?["content"] ?? "";

            if (content.isNotEmpty) {
              buffer.write(content); // Save full response
              yield content; // Send to UI
            }
          } catch (e) {
            print("JSON Parsing Error: $e\nRaw line: $line");
          }
        }
      }
      List<String> extractTitlesFromMarkdown(String responseText) {
        final regex = RegExp(r'\*\*\[([^\]]+)\]\((https?:\/\/[^\)]+)\)\*\*');
        final matches = regex.allMatches(responseText);

        return matches.map((match) => match.group(1) ?? '').toList();
      }

      // Extract titles after full response is streamed
      final extractedTitles = extractTitlesFromMarkdown(buffer.toString());
      onTitlesExtracted(extractedTitles);
    } else {
      final errorBody = await response.stream.bytesToString();
      yield '⚠️ Error: ${response.statusCode} - $errorBody';
      onTitlesExtracted([]);
    }
  }





//   /// Formats the AI response into a structured output
//   String _formatResponse(String content) {
//     return """
// $content
//
// """;
//   }

  String _formatResponse(String response) {
    // Example formatting logic
    // You can enhance this based on your exact requirements

    // Trim extra spaces or new lines
    response = response.trim();

    // Apply any special formatting (e.g., adding emojis, bolding certain text)
    // For example, we can add a check to prepend an emoji for better clarity
    if (response.isNotEmpty) {
      return "✨ $response"; // Prepending a sparkle emoji
    } else {
      return "⚠️ No content received.";
    }
  }


}


