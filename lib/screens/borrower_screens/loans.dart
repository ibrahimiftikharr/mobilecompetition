import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theloanapp/screens/signup_page.dart';
import 'package:theloanapp/screens/signin_page.dart';
import 'package:theloanapp/widgets/TextStyles.dart';
import 'package:firebase_auth/firebase_auth.dart';


class MyLoansPage extends StatelessWidget {
  final List<Map<String, dynamic>> currentLoans = [
    {
      "title": "Insting Store",
      "amount": 25.40,
      "icon": "assets/apparel.jpg",
      "status": "Approved",
    },
    {
      "title": "Home Decoration",
      "amount": 15.50,
      "icon": "assets/home.jpg",
      "status": "Approved",
    },
    {
      "title": "Sahara Beauty",
      "amount": 5.80,
      "icon": "assets/beauty.jpg",
      "status": "Approved",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/logo.jpg"),
              radius: 16,
            ),
            SizedBox(width: 8),
            Text("InstingLoan", style: TextStyle(color: Colors.black)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Green Header
          Container(
            color: Color(0xFFD5F278),
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("TOTAL BALANCE",
                          style: GoogleFonts.poppins(
                              fontSize: 12, color: Colors.black54)),
                      SizedBox(height: 4),
                      Text("\$82.50",
                          style: GoogleFonts.poppins(
                              fontSize: 32, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text("Due this month",
                          style: GoogleFonts.poppins(
                              fontSize: 14, color: Colors.black54)),
                    ],
                  ),
                ),
                Image.asset("assets/illustration.jpg", height: 80), // Replace with your image
              ],
            ),
          ),

          /// Tabs
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    child: Text("Current loans",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    child: Text("Past loans",
                        style: GoogleFonts.poppins(
                            color: Colors.black54,
                            fontWeight: FontWeight.normal)),
                  ),
                ),
              ],
            ),
          ),

          /// Loan Cards
          Expanded(
            child: ListView.builder(
              itemCount: currentLoans.length,
              itemBuilder: (context, index) {
                final loan = currentLoans[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(loan['icon']),
                        radius: 24,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(loan['title'],
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600)),
                            SizedBox(height: 4),
                            Text("\$${loan['amount'].toStringAsFixed(2)}",
                                style: GoogleFonts.poppins(
                                    fontSize: 13, color: Colors.black54)),
                            SizedBox(height: 4),
                            LinearProgressIndicator(
                              value: 0.5,
                              backgroundColor: Colors.grey[300],
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.green.shade400),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(Icons.check_circle,
                              color: Colors.green, size: 18),
                          Text("Approved",
                              style: GoogleFonts.poppins(
                                  fontSize: 12, color: Colors.green)),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),


    );
  }
}