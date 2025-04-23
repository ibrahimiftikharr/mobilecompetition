import 'package:flutter/material.dart';
import '../widgets/lesson_form.dart';
import 'package:dotted_border/dotted_border.dart';

class CreateCourseScreen extends StatefulWidget {
  const CreateCourseScreen({Key? key}) : super(key: key);

  @override
  State<CreateCourseScreen> createState() => _CreateCourseScreenState();
}

class _CreateCourseScreenState extends State<CreateCourseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _selectedDepartment;
  final List<Map<String, dynamic>> _lessons = [];

  final List<String> _departments = [
    'Computer Science',
    'Mathematics',
    'Electrical Engineering',
    'Physics',
    'Chemistry',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _addLesson() {
    setState(() {
      _lessons.add({'title': '', 'content': '', 'isExpanded': true});
    });
  }

  void _removeLesson(int index) {
    setState(() {
      _lessons.removeAt(index);
    });
  }

  void _toggleLessonExpansion(int index) {
    setState(() {
      _lessons[index]['isExpanded'] = !_lessons[index]['isExpanded'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create New Course')),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Course Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 16),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                color: Colors.grey[400]!,
                strokeWidth: 2,
                dashPattern: const [6, 3],
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image, size: 48, color: Colors.grey[400]),
                      const SizedBox(height: 8),
                      Text(
                        'Upload Cover Image',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Upload image
                        },
                        icon: const Icon(Icons.upload),
                        label: const Text('Browse'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Course Title',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.title),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a course title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Department',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.category),
                ),
                value: _selectedDepartment,
                items:
                    _departments.map((String department) {
                      return DropdownMenuItem<String>(
                        value: department,
                        child: Text(department),
                      );
                    }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDepartment = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a department';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Course Description',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.description),
                  alignLabelWithHint: true,
                ),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a course description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Micro-Lessons',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _addLesson,
                    icon: const Icon(Icons.add),
                    label: const Text('Add Lesson'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (_lessons.isEmpty)
                Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      Icon(
                        Icons.book_outlined,
                        size: 64,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No lessons added yet',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Add your first micro-lesson',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: _addLesson,
                        icon: const Icon(Icons.add),
                        label: const Text('Add Lesson'),
                      ),
                    ],
                  ),
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _lessons.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: ExpansionTile(
                        title: Text(
                          _lessons[index]['title'].isEmpty
                              ? 'Lesson ${index + 1}'
                              : _lessons[index]['title'],
                        ),
                        initiallyExpanded: _lessons[index]['isExpanded'],
                        onExpansionChanged: (expanded) {
                          _toggleLessonExpansion(index);
                        },
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                              onPressed: () => _removeLesson(index),
                            ),
                            Icon(
                              _lessons[index]['isExpanded']
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                            ),
                          ],
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: LessonForm(
                              index: index,
                              onUpdate: (title, content) {
                                setState(() {
                                  _lessons[index]['title'] = title;
                                  _lessons[index]['content'] = content;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Create course
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Course created successfully!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(Icons.check),
                  label: const Text('Create Course'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
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
