import 'package:flutter/material.dart';
import 'package:theloanapp/services/auth_service.dart';

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({super.key});

  static const String name = "Student Profile";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          // Profile Image
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: const AssetImage(
                'assets/images/profile_placeholder.png',
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Name
          Text(
            'ABC Name',
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          // Email
          Text('etc@gmail.com', style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 30),
          // Age

          const SizedBox(height: 10),
          // Qualification

          const SizedBox(height: 40),
          // Log Out Button
          ElevatedButton(
            onPressed: () {
              AuthService.logout();
            },
            style: ElevatedButton.styleFrom(),
            child: const Text('Log out', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
