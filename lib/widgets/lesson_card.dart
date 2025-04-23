import 'package:flutter/material.dart';
import '../models/lesson.dart';

class LessonCard extends StatelessWidget {
  final Lesson lesson;
  final VoidCallback onTap;

  const LessonCard({
    Key? key,
    required this.lesson,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(
                    _getLessonIcon(),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 14,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${lesson.readTime} min read',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(width: 12),
                        if (lesson.fileUrl != null)
                          Icon(
                            Icons.attach_file,
                            size: 14,
                            color: Colors.grey[600],
                          ),
                        if (lesson.imageUrl != null)
                          Icon(
                            Icons.image,
                            size: 14,
                            color: Colors.grey[600],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: lesson.isCompleted
                      ? Colors.green
                      : Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    lesson.isCompleted ? Icons.check : Icons.arrow_forward_ios,
                    size: 14,
                    color: lesson.isCompleted ? Colors.white : Colors.grey[700],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getLessonIcon() {
    if (lesson.fileUrl != null) {
      return Icons.insert_drive_file;
    } else if (lesson.imageUrl != null) {
      return Icons.image;
    } else {
      return Icons.text_snippet;
    }
  }
}
