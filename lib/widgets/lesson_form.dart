import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class LessonForm extends StatefulWidget {
  final int index;
  final Function(String, String) onUpdate;

  const LessonForm({
    Key? key,
    required this.index,
    required this.onUpdate,
  }) : super(key: key);

  @override
  State<LessonForm> createState() => _LessonFormState();
}

class _LessonFormState extends State<LessonForm> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  String? _selectedContentType = 'text';
  bool _hasImage = false;
  bool _hasFile = false;

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _titleController,
          decoration: const InputDecoration(
            labelText: 'Lesson Title',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            widget.onUpdate(_titleController.text, _contentController.text);
          },
        ),
        const SizedBox(height: 16),
        SegmentedButton<String>(
          segments: const [
            ButtonSegment<String>(
              value: 'text',
              label: Text('Text'),
              icon: Icon(Icons.text_snippet),
            ),
            ButtonSegment<String>(
              value: 'image',
              label: Text('Image'),
              icon: Icon(Icons.image),
            ),
            ButtonSegment<String>(
              value: 'file',
              label: Text('File'),
              icon: Icon(Icons.attach_file),
            ),
          ],
          selected: {_selectedContentType!},
          onSelectionChanged: (Set<String> selection) {
            setState(() {
              _selectedContentType = selection.first;
            });
          },
        ),
        const SizedBox(height: 16),
        if (_selectedContentType == 'text')
          TextFormField(
            controller: _contentController,
            decoration: const InputDecoration(
              labelText: 'Lesson Content',
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
            maxLines: 5,
            onChanged: (value) {
              widget.onUpdate(_titleController.text, _contentController.text);
            },
          )
        else if (_selectedContentType == 'image')
          DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            color: Colors.grey[400]!,
            strokeWidth: 2,
            dashPattern: const [6, 3],
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!_hasImage) ...[
                    Icon(
                      Icons.image,
                      size: 48,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Upload Image',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _hasImage = true;
                        });
                      },
                      icon: const Icon(Icons.upload),
                      label: const Text('Browse'),
                    ),
                  ] else ...[
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.network(
                          'https://via.placeholder.com/300x150',
                          width: double.infinity,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 16,
                            child: IconButton(
                              icon: const Icon(Icons.close, size: 16),
                              onPressed: () {
                                setState(() {
                                  _hasImage = false;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          )
        else if (_selectedContentType == 'file')
          DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            color: Colors.grey[400]!,
            strokeWidth: 2,
            dashPattern: const [6, 3],
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!_hasFile) ...[
                    Icon(
                      Icons.upload_file,
                      size: 48,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Upload File (PDF, DOC, etc.)',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _hasFile = true;
                        });
                      },
                      icon: const Icon(Icons.upload),
                      label: const Text('Browse'),
                    ),
                  ] else ...[
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.insert_drive_file, color: Colors.blue),
                          const SizedBox(width: 8),
                          const Text(
                            'lesson_material.pdf',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.close, size: 16),
                            onPressed: () {
                              setState(() {
                                _hasFile = false;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Text(
              'AI Enhancements:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Wrap(
                spacing: 8,
                children: [
                  FilterChip(
                    label: const Text('Generate Summary'),
                    selected: true,
                    onSelected: (selected) {},
                    avatar: const Icon(Icons.auto_awesome, size: 16),
                  ),
                  FilterChip(
                    label: const Text('Create Flashcards'),
                    selected: true,
                    onSelected: (selected) {},
                    avatar: const Icon(Icons.flash_on, size: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
