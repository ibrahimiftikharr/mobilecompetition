import 'package:flutter/material.dart';
import '../models/department.dart';
import '../models/course.dart';
import '../models/lesson.dart';
import '../models/tutor.dart';
import '../models/user.dart';
import '../models/flashcard.dart';
import '../models/qa.dart';
import '../models/answer.dart';

class DataService {
  static List<Department> getDepartments() {
    return [
      Department(
        id: 'cs',
        name: 'Computer Science',
        icon: Icons.computer,
        color: const Color(0xFF8B5CF6),
        courseCount: 8,
      ),
      Department(
        id: 'math',
        name: 'Mathematics',
        icon: Icons.calculate,
        color: const Color(0xFFF472B6),
        courseCount: 6,
      ),
      Department(
        id: 'ee',
        name: 'Electrical Engineering',
        icon: Icons.electrical_services,
        color: const Color(0xFF60A5FA),
        courseCount: 5,
      ),
      Department(
        id: 'physics',
        name: 'Physics',
        icon: Icons.science,
        color: const Color(0xFFFCD34D),
        courseCount: 4,
      ),
      Department(
        id: 'chem',
        name: 'Chemistry',
        icon: Icons.biotech,
        color: const Color(0xFF34D399),
        courseCount: 3,
      ),
      Department(
        id: 'bio',
        name: 'Biology',
        icon: Icons.spa,
        color: const Color(0xFFEC4899),
        courseCount: 4,
      ),
    ];
  }

  static List<Course> getCoursesByDepartment(String departmentId) {
    final tutor = Tutor(
      id: 't1',
      name: 'Prof. Jane Cooper',
      email: 'jane.cooper@example.com',
      avatarUrl: 'https://randomuser.me/api/portraits/women/10.jpg',
      experience: 8,
    );

    final courses = [
      Course(
        id: 'c1',
        title: 'Programming Fundamentals',
        description:
            'Learn the basics of programming with this introductory course.',
        coverUrl:
            'https://images.unsplash.com/photo-1587620962725-abab7fe55159',
        tutor: tutor,
        enrolledStudents: [],
        lessons: _getLessons(),
        progress: 0.3,
      ),
      Course(
        id: 'c2',
        title: 'Object-Oriented Programming',
        description: 'Master the principles of object-oriented programming.',
        coverUrl:
            'https://images.unsplash.com/photo-1516116216624-53e697fedbea',
        tutor: tutor,
        enrolledStudents: [],
        lessons: _getLessons(),
        progress: 0.5,
      ),
      Course(
        id: 'c3',
        title: 'Data Structures & Algorithms',
        description:
            'Learn essential data structures and algorithms for efficient programming.',
        coverUrl:
            'https://images.unsplash.com/photo-1515879218367-8466d910aaa4',
        tutor: tutor,
        enrolledStudents: [],
        lessons: _getLessons(),
        progress: 0.7,
      ),
      Course(
        id: 'c4',
        title: 'Database Management Systems',
        description:
            'Understand the principles of database design and management.',
        coverUrl: 'https://images.unsplash.com/photo-1544383835-bda2bc66a55d',
        tutor: tutor,
        enrolledStudents: [],
        lessons: _getLessons(),
        progress: 0.2,
      ),
      Course(
        id: 'c5',
        title: 'Computer Networks',
        description:
            'Learn about computer networks and communication protocols.',
        coverUrl: 'https://images.unsplash.com/photo-1558494949-ef010cbdcc31',
        tutor: tutor,
        enrolledStudents: [],
        lessons: _getLessons(),
        progress: 0.0,
      ),
    ];

    if (departmentId == 'math') {
      return [
        Course(
          id: 'm1',
          title: 'Calculus I',
          description:
              'Introduction to differential and integral calculus with applications.',
          coverUrl:
              'https://images.unsplash.com/photo-1635070041078-e363dbe005cb',
          tutor: tutor,
          enrolledStudents: [],
          lessons: _getLessons(),
          progress: 0.4,
        ),
        Course(
          id: 'm2',
          title: 'Linear Algebra',
          description:
              'Study of vectors, vector spaces, linear transformations, and matrices.',
          coverUrl:
              'https://images.unsplash.com/photo-1509228468518-180dd4864904',
          tutor: tutor,
          enrolledStudents: [],
          lessons: _getLessons(),
          progress: 0.6,
        ),
        Course(
          id: 'm3',
          title: 'Probability & Statistics',
          description:
              'Introduction to probability theory and statistical methods.',
          coverUrl: 'https://images.unsplash.com/photo-1551288049-bebda4e38f71',
          tutor: tutor,
          enrolledStudents: [],
          lessons: _getLessons(),
          progress: 0.1,
        ),
      ];
    }

    return courses;
  }

  static List<Course> getTutorCourses() {
    final tutor = Tutor(
      id: 't1',
      name: 'Prof. Jane Cooper',
      email: 'jane.cooper@example.com',
      avatarUrl: 'https://randomuser.me/api/portraits/women/10.jpg',
      experience: 8,
    );

    final students = List.generate(
      20,
      (index) => User(
        id: 's$index',
        name: 'Student $index',
        email: 'student$index@example.com',
        avatarUrl: 'https://randomuser.me/api/portraits/men/${index % 10}.jpg',
      ),
    );

    return [
      Course(
        id: 'c1',
        title: 'Programming Fundamentals',
        description:
            'Learn the basics of programming with this introductory course.',
        coverUrl:
            'https://images.unsplash.com/photo-1587620962725-abab7fe55159',
        tutor: tutor,
        enrolledStudents: students.sublist(0, 15),
        lessons: _getLessons(),
        progress: 0.3,
      ),
      Course(
        id: 'c2',
        title: 'Object-Oriented Programming',
        description: 'Master the principles of object-oriented programming.',
        coverUrl:
            'https://images.unsplash.com/photo-1516116216624-53e697fedbea',
        tutor: tutor,
        enrolledStudents: students.sublist(5, 18),
        lessons: _getLessons(),
        progress: 0.5,
      ),
      Course(
        id: 'c3',
        title: 'Data Structures & Algorithms',
        description:
            'Learn essential data structures and algorithms for efficient programming.',
        coverUrl:
            'https://images.unsplash.com/photo-1515879218367-8466d910aaa4',
        tutor: tutor,
        enrolledStudents: students.sublist(2, 12),
        lessons: _getLessons(),
        progress: 0.7,
      ),
    ];
  }

  static List<Lesson> _getLessons() {
    final user = User(
      id: 'u1',
      name: 'Alex Johnson',
      email: 'alex@example.com',
      avatarUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
    );

    final instructor = User(
      id: 't1',
      name: 'Prof. Jane Cooper',
      email: 'jane.cooper@example.com',
      avatarUrl: 'https://randomuser.me/api/portraits/women/10.jpg',
      isInstructor: true,
    );

    return [
      Lesson(
        id: 'l1',
        title: 'Introduction to the Course',
        textContent:
            'Welcome to this course! In this lesson, we will cover the basic concepts and set expectations for what you will learn throughout this course. This micro-lesson is designed to give you a quick overview of the subject matter.',
        readTime: 5,
        isCompleted: true,
        flashcards: [
          Flashcard(
            id: 'f1',
            question: 'What is the main purpose of this course?',
            answer:
                'To provide bite-sized learning on the subject matter in an accessible format.',
            isAIGenerated: true,
          ),
          Flashcard(
            id: 'f2',
            question: 'How are the lessons structured in this course?',
            answer:
                'As micro-lessons with text, images, and files, enhanced with AI-generated summaries and flashcards.',
            isAIGenerated: true,
          ),
        ],
        qaThread: [
          QA(
            id: 'q1',
            question: 'How much time should I dedicate to each lesson?',
            askedBy: user,
            askedAt: DateTime.now().subtract(const Duration(days: 2)),
            answers: [
              Answer(
                id: 'a1',
                answer:
                    'Each micro-lesson is designed to be completed in 5-10 minutes, but I recommend spending additional time reviewing the flashcards and summary for better retention.',
                answeredBy: instructor,
                answeredAt: DateTime.now().subtract(const Duration(days: 1)),
              ),
            ],
          ),
        ],
      ),
      Lesson(
        id: 'l2',
        title: 'Core Concepts',
        textContent:
            'In this lesson, we will explore the fundamental concepts that form the foundation of our subject. Understanding these core principles is essential for mastering more advanced topics later in the course.',
        readTime: 8,
        isCompleted: true,
        flashcards: [
          Flashcard(
            id: 'f3',
            question:
                'What are the three main principles discussed in this lesson?',
            answer: 'Abstraction, encapsulation, and modularity.',
            isAIGenerated: true,
          ),
        ],
        qaThread: [],
      ),
      Lesson(
        id: 'l3',
        title: 'Practical Applications',
        textContent:
            'Now that we understand the core concepts, let\'s see how they apply in real-world scenarios. This lesson will demonstrate practical applications through examples and case studies.',
        imageUrl:
            'https://images.unsplash.com/photo-1581093458791-9d15482aae9e',
        readTime: 10,
        isCompleted: false,
        flashcards: [],
        qaThread: [],
      ),
      Lesson(
        id: 'l4',
        title: 'Advanced Techniques',
        textContent:
            'This lesson covers advanced techniques that build upon the fundamentals we\'ve already learned. We\'ll explore sophisticated approaches to solving complex problems in our domain.',
        fileUrl: 'https://example.com/files/advanced_techniques.pdf',
        readTime: 12,
        isCompleted: false,
        flashcards: [],
        qaThread: [],
      ),
      Lesson(
        id: 'l5',
        title: 'Final Review & Next Steps',
        textContent:
            'In this final lesson, we\'ll review everything we\'ve learned and discuss potential next steps for continuing your learning journey. We\'ll also provide resources for further study.',
        readTime: 7,
        isCompleted: false,
        flashcards: [],
        qaThread: [],
      ),
    ];
  }
}
