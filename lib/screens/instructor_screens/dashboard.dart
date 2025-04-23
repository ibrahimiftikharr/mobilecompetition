import 'package:flutter/material.dart';
import 'package:theloanapp/widgets/analytics_card.dart';
import 'package:theloanapp/widgets/course_card.dart';
import 'package:theloanapp/providers/course_provider.dart';
import 'package:theloanapp/screens/create_course_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static const String name = "Dashboard";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(tutorCoursesProvider);

    return SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome back, Professor!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Here\'s an overview of your courses and analytics',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF6B7280),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Analytics Overview',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: AnalyticsCard(
                    title: 'Total Students',
                    value: '248',
                    icon: Icons.people,
                    color: const Color(0xFF8B5CF6),
                    change: '+12%',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AnalyticsCard(
                    title: 'Course Completions',
                    value: '85',
                    icon: Icons.school,
                    color: const Color(0xFFF472B6),
                    change: '+8%',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: AnalyticsCard(
                    title: 'Questions Asked',
                    value: '156',
                    icon: Icons.question_answer,
                    color: const Color(0xFF60A5FA),
                    change: '+24%',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AnalyticsCard(
                    title: 'Avg. Rating',
                    value: '4.8',
                    icon: Icons.star,
                    color: const Color(0xFFFCD34D),
                    change: '+0.2',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Student Engagement',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const style = TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 12,
                          );
                          String text;
                          switch (value.toInt()) {
                            case 0:
                              text = 'Mon';
                              break;
                            case 2:
                              text = 'Wed';
                              break;
                            case 4:
                              text = 'Fri';
                              break;
                            case 6:
                              text = 'Sun';
                              break;
                            default:
                              return const SizedBox();
                          }
                          return Text(text, style: style);
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 3),
                        FlSpot(1, 2),
                        FlSpot(2, 5),
                        FlSpot(3, 3.1),
                        FlSpot(4, 4),
                        FlSpot(5, 3),
                        FlSpot(6, 4),
                      ],
                      isCurved: true,
                      color: Theme.of(context).colorScheme.primary,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Your Courses',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateCourseScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Create New'),
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: CourseCard(
                    course: courses[index],
                    showStudentCount: true,
                  ),
                );
              },
            ),
          ],
        ),
      );
  }
}
