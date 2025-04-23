import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/course_card.dart';
import '../../models/department.dart';
import '../../providers/course_provider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CourseListScreen extends ConsumerWidget {
  final Department department;

  const CourseListScreen({Key? key, required this.department}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(coursesByDepartmentProvider(department.id));

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(department.name),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Courses in ${department.name}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${courses.length} courses available',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B7280),
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: AnimationLimiter(
                  child: ListView.builder(
                    itemCount: courses.length,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 500),
                        child: SlideAnimation(
                          horizontalOffset: 50.0,
                          child: FadeInAnimation(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: CourseCard(course: courses[index]),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
