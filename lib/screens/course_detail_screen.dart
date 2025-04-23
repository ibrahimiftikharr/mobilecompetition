import 'package:flutter/material.dart';
import '../models/course.dart';
import '../widgets/lesson_card.dart';
import '../widgets/tutor_info.dart';
import 'lesson_detail_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CourseDetailScreen extends StatelessWidget {
  final Course course;

  const CourseDetailScreen({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                course.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black45,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(course.coverUrl, fit: BoxFit.cover),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black54],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: LinearPercentIndicator(
                          lineHeight: 8.0,
                          percent: course.progress,
                          backgroundColor: Colors.grey[200],
                          progressColor: Theme.of(context).colorScheme.primary,
                          barRadius: const Radius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '${(course.progress * 100).toInt()}%',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    course.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF4B5563),
                    ),
                  ),
                  const SizedBox(height: 24),
                  TutorInfo(tutor: course.tutor),
                  const SizedBox(height: 24),
                  const Text(
                    'Micro-Lessons',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: LessonCard(
                  lesson: course.lessons[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => LessonDetailScreen(
                              lesson: course.lessons[index],
                              courseTitle: course.title,
                            ),
                      ),
                    );
                  },
                ),
              );
            }, childCount: course.lessons.length),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Enroll in course
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Enrolled in course successfully!'),
              backgroundColor: Color(0xFF8B5CF6),
            ),
          );
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        label: const Text('Enroll Now'),
        icon: const Icon(Icons.school),
      ),
    );
  }
}
