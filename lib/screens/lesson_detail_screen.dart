import 'package:theloanapp/models/flashcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/lesson.dart';
import '../widgets/flashcard_widget.dart';
import '../widgets/qa_thread.dart';
import '../providers/lesson_provider.dart';

class LessonDetailScreen extends ConsumerStatefulWidget {
  final Lesson lesson;
  final String courseTitle;

  const LessonDetailScreen({
    Key? key,
    required this.lesson,
    required this.courseTitle,
  }) : super(key: key);

  @override
  ConsumerState<LessonDetailScreen> createState() => _LessonDetailScreenState();
}

class _LessonDetailScreenState extends ConsumerState<LessonDetailScreen> {
  int _currentTab = 0;
  final List<String> _tabs = ['Content', 'Summary', 'Flashcards', 'Q&A'];

  @override
  void initState() {
    super.initState();
    // Select this lesson in the provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(selectedLessonProvider.notifier).select(widget.lesson);
    });
  }

  @override
  void dispose() {
    ref.read(selectedLessonProvider.notifier).clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.courseTitle),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.lesson.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${widget.lesson.readTime} min read',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Consumer(
                      builder: (context, ref, child) {
                        final isCompleted = ref.watch(lessonProgressProvider)
                            .containsKey(widget.lesson.id) || widget.lesson.isCompleted;
                        
                        return Row(
                          children: [
                            Icon(
                              isCompleted ? Icons.check_circle : Icons.circle_outlined,
                              size: 16,
                              color: isCompleted ? Colors.green : Colors.grey[600],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              isCompleted ? 'Completed' : 'Not completed',
                              style: TextStyle(
                                fontSize: 14,
                                color: isCompleted ? Colors.green : Colors.grey[600],
                              ),
                            ),
                          ],
                        );
                      }
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _tabs.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentTab = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: _currentTab == index
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        _tabs[index],
                        style: TextStyle(
                          color: _currentTab == index
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey[600],
                          fontWeight: _currentTab == index ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: _buildTabContent(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    // Navigate to previous lesson
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Previous'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Consumer(
                  builder: (context, ref, child) {
                    final isCompleted = ref.watch(lessonProgressProvider)
                        .containsKey(widget.lesson.id) || widget.lesson.isCompleted;

                    return ElevatedButton.icon(
                      onPressed: () {
                        ref.read(lessonProgressProvider.notifier).markAsCompleted(widget.lesson.id);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Lesson marked as completed!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      icon: Icon(isCompleted ? Icons.check_circle : Icons.check),
                      label: FittedBox(
                        child: Text(isCompleted ? 'Completed' : 'Mark Complete'),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isCompleted
                            ? Colors.green
                            : Theme.of(context).colorScheme.primary,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    // Navigate to next lesson
                  },
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Next'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

  Widget _buildTabContent() {
    switch (_currentTab) {
      case 0:
        return _buildContentTab();
      case 1:
        return _buildSummaryTab();
      case 2:
        return _buildFlashcardsTab();
      case 3:
        return _buildQATab();
      default:
        return _buildContentTab();
    }
  }

  Widget _buildContentTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.lesson.textContent != null)
            Text(
              widget.lesson.textContent!,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Color(0xFF4B5563),
              ),
            ),
          if (widget.lesson.imageUrl != null) ...[
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.lesson.imageUrl!,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
          if (widget.lesson.fileUrl != null) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Row(
                children: [
                  const Icon(Icons.attach_file, color: Color(0xFF8B5CF6)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Attachment',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1F2937),
                          ),
                        ),
                        Text(
                          widget.lesson.fileUrl!.split('/').last,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.download, color: Color(0xFF8B5CF6)),
                    onPressed: () {
                      // Download file
                    },
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSummaryTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer(
            builder: (context, ref, child) {
              final summaryAsync = ref.watch(lessonSummaryProvider(widget.lesson));

              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.purple[100]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.auto_awesome,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'AI-Generated Summary',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    summaryAsync.when(
                      data: (summary) => Text(
                        summary,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.6,
                          color: Color(0xFF4B5563),
                        ),
                      ),
                      loading: () => const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      error: (error, stack) => Text(
                        'Error generating summary: $error',
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Key Points',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 12),
          ...List.generate(
            3,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Key point ${index + 1} about this lesson that summarizes an important concept.',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF4B5563),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlashcardsTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Flashcards',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Add new flashcard
                  _showAddFlashcardDialog();
                },
                icon: const Icon(Icons.add),
                label: const Text('Add'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Consumer(
            builder: (context, ref, child) {
              final flashcardsAsync = ref.watch(lessonFlashcardsProvider(widget.lesson));
              
              return flashcardsAsync.when(
                data: (flashcards) {
                  if (flashcards.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.flash_on,
                            size: 64,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No flashcards yet',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Add your first flashcard',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  
                  return ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: flashcards.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: FlashcardWidget(
                          flashcard: flashcards[index],
                        ),
                      );
                    },
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, stack) => Center(
                  child: Text(
                    'Error loading flashcards: $error',
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildQATab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Questions & Answers',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 16),
          if (widget.lesson.qaThread.isEmpty)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Icon(
                    Icons.question_answer_outlined,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No questions yet',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Be the first to ask a question',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Ask a question
                      _showAskQuestionDialog();
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Ask a Question'),
                  ),
                ],
              ),
            )
          else
            Column(
              children: [
                ...widget.lesson.qaThread.map((qa) => QAThread(qa: qa)),
                const SizedBox(height: 16),
                if (widget.lesson.qaThread.length < 1)
                  ElevatedButton.icon(
                    onPressed: () {
                      // Ask a question
                      _showAskQuestionDialog();
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Ask a Question'),
                  ),
              ],
            ),
        ],
      ),
    );
  }

  void _showAddFlashcardDialog() {
    final questionController = TextEditingController();
    final answerController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Flashcard'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: questionController,
              decoration: const InputDecoration(
                labelText: 'Question',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: answerController,
              decoration: const InputDecoration(
                labelText: 'Answer',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          Consumer(
            builder: (context, ref, child) {
              return ElevatedButton(
                onPressed: () {
                  // Add flashcard
                  if (questionController.text.isNotEmpty && answerController.text.isNotEmpty) {
                    final flashcard = Flashcard(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      question: questionController.text,
                      answer: answerController.text,
                      isAIGenerated: false,
                    );
                    
                    ref.read(userFlashcardsProvider.notifier).addFlashcard(
                      widget.lesson.id,
                      flashcard,
                    );
                    
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Flashcard added successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
                child: const Text('Add'),
              );
            }
          ),
        ],
      ),
    );
  }

  void _showAskQuestionDialog() {
    final questionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ask a Question'),
        content: TextField(
          controller: questionController,
          decoration: const InputDecoration(
            labelText: 'Your Question',
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
              // Post question
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Question posted successfully!'),
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
