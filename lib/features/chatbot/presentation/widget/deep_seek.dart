import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:mentroverso/core/utils/constants.dart';

class DeepSeekService {
  final String apiKey = Constant.apiKey;
  final String apiUrl = 'https://openrouter.ai/api/v1/chat/completions';



  Stream<String> streamResponse(String prompt) async* {
    try {
      final request = http.Request('POST', Uri.parse(apiUrl))
        ..headers.addAll({
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        })
        ..body = jsonEncode({
          "model": "deepseek/deepseek-chat:free",
          "messages": [{"role": "user", "content": prompt}],
          "stream": true,
        });

      final response = await http.Client().send(request);
      String buffer = "";

      if (response.statusCode == 200) {
        await for (var chunk in response.stream.transform(utf8.decoder)) {
          buffer += chunk;

          // Ensure we process complete JSON objects only
          List<String> messages = buffer.split("\n");
          buffer = ""; // Reset buffer

          for (var message in messages) {
            if (message.startsWith("data: ")) {
              message = message.replaceFirst("data: ", "").trim();
            }

            if (message.isNotEmpty && message != "[DONE]") {
              try {
                final jsonResponse = jsonDecode(message);
                final content = jsonResponse["choices"]?[0]?["delta"]?["content"] ?? "";

                if (content.isNotEmpty) {
                  yield content;
                }
              } catch (e) {
                print("JSON Parsing Error: $e \n Raw Response: $message");
              }
            }
          }
        }
      } else {
        yield 'Error: ${response.statusCode} - ${await response.stream.bytesToString()}';
      }
    } catch (e) {
      yield 'Error: $e';
    }
  }

  Future<String> analyzeFile(String content) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        "model": "deepseek/deepseek-chat:free",
        "messages": [
          {"role": "user", "content": "Analyze this file: $content"}
        ],
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return jsonResponse["choices"][0]["message"]["content"] ?? "No response";
    } else {
      throw Exception('Failed to analyze file');
    }
  }



}
