import 'package:flutter/material.dart';
import 'package:theloanapp/widgets/TextStyles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:theloanapp/services/auth_service.dart';
import 'package:theloanapp/screens/signin_page.dart';


class BorrowerHomePage extends StatefulWidget {

  BorrowerHomePage({super.key, required this.currUser});

  final User currUser;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<BorrowerHomePage> {
  int _selectedIndex = 0; // For bottom navigation bar selection


  final List<Map<String, String>> loanCategories = [
    {"title": "Apparel", "icon": "assets/apparel.jpg"},
    {"title": "Beauty", "icon": "assets/beauty.jpg"},
    {"title": "Electronics", "icon": "assets/electronics.jpg"},
    {"title": "Home", "icon": "assets/home.jpg"},
  ];

  final List<Map<String, String>> trendingStores = [
    {
      "title": "Insting Store",
      "subtitle": "Big saving on furniture",
      "image": "assets/insting_store.webp",
    },
    {
      "title": "Electronics Abuy",
      "subtitle": "Low installments",
      "image": "assets/eAbuy.jpg",
    },
    {
      "title": "Insting Car",
      "subtitle": "Big discount on Cars",
      "image": "assets/car_store.webp",
    }
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/logo.jpg"),
              radius: 16,
            ),
            SizedBox(width: 8),
            Text("InstingLoan", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            myPoppinText("Manage loan", FontWeight.bold, 22),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: "Search loan, shop or pay ...",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),

            /// Loan Categories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                myPoppinText("Loan categories", FontWeight.bold, 18),
                TextButton(onPressed: () {}, child: Text("View all"))
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: loanCategories.map((category) {
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[200],
                      child: Image.asset(category["icon"]!, width: 30),
                    ),
                    SizedBox(height: 6),
                    myPoppinText(category["title"]!, FontWeight.normal, 12),
                  ],
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            /// Trending Store
            myPoppinText("Trending Store", FontWeight.bold, 18),
            SizedBox(height: 10),
            Container(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trendingStores.length,
                itemBuilder: (context, index) {
                  final store = trendingStores[index];
                  return Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            store["image"]!,
                            width: 150,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8),
                        myPoppinText(store["title"]!, FontWeight.bold, 16),
                        myPoppinText(store["subtitle"]!, FontWeight.normal, 12),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}