import 'package:theloanapp/providers/navigation_provider.dart';
import 'package:theloanapp/screens/instructor_screens/create_course.dart';
import 'package:theloanapp/screens/instructor_screens/dashboard.dart';
import 'package:theloanapp/screens/instructor_screens/instructor_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theloanapp/services/auth_service.dart';

class InstructorNavigation extends ConsumerWidget {
  final currentUser;
  const InstructorNavigation({super.key, required this.currentUser});

static const List<String> _screenNames = <String>[
    DashboardScreen.name,
    InstructorProfileScreen.name,
  ];

  static const List<Widget> _screens = <Widget>[
    DashboardScreen(),
    InstructorProfileScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navigationIndexProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(_screenNames[selectedIndex])
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.purple
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text(
            'Instructor Portal',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.dashboard),
          title: const Text('Dashboard'),
          onTap: () {
            ref.read(navigationIndexProvider.notifier).state = 0;
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.add_box),
          title: const Text('Create Course'),
          onTap: () {
            ref.read(navigationIndexProvider.notifier).state = 1;
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateCourseScreen()));
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            // Add your logout logic here
            Navigator.pop(context);
            // Navigator.of(context).pushReplacementNamed('/login');
          },
        ),
          ],
        ),
      ),
      body: _screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: (index) => ref.read(navigationIndexProvider.notifier).state = index,
      ),
    );
  }
}

