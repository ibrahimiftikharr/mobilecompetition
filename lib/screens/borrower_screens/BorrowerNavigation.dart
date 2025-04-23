import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:theloanapp/screens/borrower_screens/home_page.dart';
import 'package:theloanapp/screens/borrower_screens/loans.dart';


class BorrowerNavigationn extends StatefulWidget {
  final User currUser;

  const BorrowerNavigationn({super.key, required this.currUser});

  @override
  State<BorrowerNavigationn> createState() => _BorrowerNavigationnState();
}

class _BorrowerNavigationnState extends State<BorrowerNavigationn> {
  int _selectedIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      BorrowerHomePage(currUser: widget.currUser),
      MyLoansPage(),
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
