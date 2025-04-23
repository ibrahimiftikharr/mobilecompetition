import 'package:flutter/material.dart';
import '../models/qa.dart';
import 'package:timeago/timeago.dart' as timeago;

class QAThread extends StatelessWidget {
  final QA qa;

  const QAThread({
    Key? key,
    required this.qa,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundImage: NetworkImage(qa.askedBy.avatarUrl),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      qa.askedBy.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      timeago.format(qa.askedAt),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  qa.question,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ],
            ),
          ),
          if (qa.answers.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...qa.answers.map((answer) => Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 14,
                                  backgroundImage: NetworkImage(answer.answeredBy.avatarUrl),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  answer.answeredBy.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Color(0xFF1F2937),
                                  ),
                                ),
                                if (answer.answeredBy.isInstructor)
                                  Container(
                                    margin: const EdgeInsets.only(left: 8),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: const Text(
                                      'Instructor',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                const Spacer(),
                                Text(
                                  timeago.format(answer.answeredAt),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              answer.answer,
                              style: const TextStyle(
                                fontSize: 14,
                                height: 1.5,
                                color: Color(0xFF4B5563),
                              ),
                            ),
                          ],
                        ),
                      )),
                  TextButton.icon(
                    onPressed: () {
                      // Add answer
                      _showAddAnswerDialog(context);
                    },
                    icon: const Icon(Icons.reply, size: 16),
                    label: const Text('Add Reply'),
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Add answer
                  _showAddAnswerDialog(context);
                },
                icon: const Icon(Icons.reply),
                label: const Text('Answer Question'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showAddAnswerDialog(BuildContext context) {
    final answerController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Answer Question'),
        content: TextField(
          controller: answerController,
          decoration: const InputDecoration(
            labelText: 'Your Answer',
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Post answer
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Answer posted successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text('Post'),
          ),
        ],
      ),
    );
  }
}
