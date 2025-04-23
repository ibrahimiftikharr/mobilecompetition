import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:theloanapp/screens/investor_screens/home_page.dart';
import 'package:theloanapp/screens/investor_screens/loans.dart';


class InvestorNavigation extends StatefulWidget {
  final User currUser;

  const InvestorNavigation({super.key, required this.currUser});

  @override
  State<InvestorNavigation> createState() => _InvestorNavigationState();
}

class _InvestorNavigationState extends State<InvestorNavigation> {
  int _selectedIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      InvestorHomePage(currUser: widget.currUser),
      LoanPage()
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: 'Loans'),
        ],
      ),
    );
  }
}
