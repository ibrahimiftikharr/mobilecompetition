import 'package:flutter/material.dart';
import 'package:theloanapp/providers/department_provider.dart';
import 'package:theloanapp/widgets/analytics_card.dart';
import 'package:theloanapp/widgets/course_card.dart';
import 'package:theloanapp/providers/course_provider.dart';
import 'package:theloanapp/screens/create_course_screen.dart';
import 'package:theloanapp/screens/student_screens/course_list_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudentDashboardScreen extends ConsumerWidget {
  const StudentDashboardScreen({super.key});
  static const String name = "Dashboard";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final departments = ref.watch(departmentsProvider);

    return SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome back, Student!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Following departments are available for courses',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              //height: 300,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: departments.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  final department = departments[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CourseListScreen(department: department),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: department.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(department.icon, size: 40, color: department.color),
                          const SizedBox(height: 8),
                          Text(
                            department.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1F2937),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),


            )
            ]
        ),
      );
  }
}
