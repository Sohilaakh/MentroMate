import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/themes.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/linear_gradient_back_ground_color.dart';
import '../../../home/presentation/widgets/home_app_bar.dart';
import '../widgets/motivational_banner.dart';

class RecommendedCourses extends StatefulWidget {
  const RecommendedCourses({super.key});

  @override
  State<RecommendedCourses> createState() => _RecommendedCoursesState();
}

class _RecommendedCoursesState extends State<RecommendedCourses> {
  List<String> courses = [];
  List<bool> isCheckedList = [];

  Future<void> fetchCourses(String userId) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .collection('questionnaire_results')
          .get();

      List<String> allCourses = [];

      for (var doc in snapshot.docs) {
        final data = doc.data();
        if (data.containsKey('suggestedCourses') && data['suggestedCourses'] is List) {
          allCourses.addAll(List<String>.from(data['suggestedCourses'] as List));
        }
      }

      setState(() {
        courses = allCourses.toSet().toList(); // remove duplicates
        isCheckedList = List<bool>.filled(courses.length, false);
      });
    } catch (e) {
      print("Error fetching suggested courses: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      fetchCourses(user.uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LinearGradientBackGroundColor(
          beginColor: Alignment.bottomLeft,
          endColor: Alignment.topRight,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: HomeAppBar(),
          body: courses.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Column(
            children: [
              const SizedBox(height: 36),
              MotivationalBanner(
                text: 'Your Learning Journey Starts Here!',
                imagePath: AssetsData.journey,
              ),
              const SizedBox(height: 55),
              Expanded(
                child: ListView.builder(
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: Row(
                        children: [
                          Checkbox(
                            value: isCheckedList[index],
                            onChanged: (bool? value) {
                              setState(() {
                                isCheckedList[index] = value ?? false;

                                // Optional: remove item when checked
                                // if (isCheckedList[index]) {
                                //   courses.removeAt(index);
                                //   isCheckedList.removeAt(index);
                                // }
                              });
                            },
                          ),
                          Expanded(
                            child: Text(
                              courses[index],
                              style: Styles.textStyle14,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
