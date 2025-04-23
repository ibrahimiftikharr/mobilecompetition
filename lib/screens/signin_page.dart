import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theloanapp/widgets/scaffold.dart';
import 'package:theloanapp/widgets/signup_button.dart';
import 'package:theloanapp/widgets/signup_field.dart';
import 'package:theloanapp/screens/signup_page.dart';
import 'package:theloanapp/screens/borrower_screens/BorrowerNavigation.dart';
import 'package:theloanapp/screens/investor_screens/InvestorNavigation.dart';
import 'package:theloanapp/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SigninPage extends StatefulWidget{
  @override
  SigninPageState createState()=>SigninPageState();
}

class SigninPageState extends State<SigninPage>{

  TextEditingController signinEmailController=TextEditingController();
  TextEditingController signinPasswordController=TextEditingController();
  final AuthService authService = AuthService();
  Future<void> signIn() async {
    if (signinEmailController.text.isEmpty || signinPasswordController.text.isEmpty) {
      scaffold('One or more field is empty!', context);
      return;
    }

    if (signinPasswordController.text.length < 6) {
      scaffold('Password should be above 6 in length!', context);
      return;
    }

    try {
      User? user = await authService.signInWithEmail(
          signinEmailController.text, signinPasswordController.text);



      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (userDoc.exists) {
          String role = userDoc['role'];
          scaffold('Signed into your ${role} account!', context);

          if (role == 'Investor') {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => InvestorNavigation(currUser: user)),
                  (Route<dynamic> route) => false,
            );
          } else if (role == 'Borrower') {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => BorrowerNavigationn(currUser: user)),
                  (Route<dynamic> route) => false,
            );
          } else {
            scaffold('Account not found!', context);
          }
        }
      } else {
        scaffold('User doesnt exist!', context);
      }
    } catch (e) {
      print('SIGNIN ERROR: ${e.toString()}');
      scaffold(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(),
            backgroundColor: Color(0xFFFFFCF4),
            body:SingleChildScrollView(
                child:  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/leaves.png', height: 250.h,),

                        SizedBox(height: 15.h,),

                        Text('Hello Again!',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp
                          ),
                        ),

                        SizedBox(height: 10.h,),

                        Text('Welcome back you have been missed',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp
                          ),
                        ),

                        SizedBox(height: 15.h,),

                        CustomField('Email', false,signinEmailController),

                        SizedBox(height: 15.h,),

                        CustomField('Password', true,signinPasswordController),

                        SizedBox(height: 65.h,),

                        CustomButton('Sign in', signIn),

                        SizedBox(height: 70.h,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Dont have an account?',
                              style: GoogleFonts.poppins(
                                  fontSize: 13.sp
                              ),
                            ),

                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
                              },
                              child: Text(
                                ' Sign up',
                                style: GoogleFonts.poppins(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            )

                          ],
                        )



                      ],
                    )
                )
            )

        );

  }
}