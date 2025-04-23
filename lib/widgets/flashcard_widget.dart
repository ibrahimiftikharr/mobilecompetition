import 'package:flutter/material.dart';
import '../models/flashcard.dart';
import 'package:flip_card/flip_card.dart';

class FlashcardWidget extends StatelessWidget {
  final Flashcard flashcard;

  const FlashcardWidget({
    Key? key,
    required this.flashcard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: _buildFlashcardSide(
        context,
        flashcard.question,
        Theme.of(context).colorScheme.primary.withOpacity(0.1),
        Theme.of(context).colorScheme.primary,
        Icons.help_outline,
        'Question',
        flashcard.isAIGenerated,
      ),
      back: _buildFlashcardSide(
        context,
        flashcard.answer,
        Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        Theme.of(context).colorScheme.secondary,
        Icons.lightbulb_outline,
        'Answer',
        flashcard.isAIGenerated,
      ),
    );
  }

  Widget _buildFlashcardSide(
    BuildContext context,
    String text,
    Color backgroundColor,
    Color accentColor,
    IconData icon,
    String label,
    bool isAIGenerated,
  ) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: accentColor.withOpacity(0.3)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: accentColor),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: accentColor,
                  ),
                ),
                if (isAIGenerated) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.purple[100],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.auto_awesome,
                          size: 12,
                          color: Colors.purple[800],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'AI',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const Spacer(),
                Text(
                  'Tap to flip',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Color(0xFF1F2937),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
