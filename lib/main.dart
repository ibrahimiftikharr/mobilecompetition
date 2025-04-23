import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theloanapp/screens/signup_page.dart';
import 'package:theloanapp/screens/signin_page.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(426, 950),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue),
          title: 'Study App',
          home: StartScreen(),

        );
      },
    );
  }
}

class StartScreen extends StatelessWidget {

  void signin(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SigninPage()));
  }

  void signup(context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
  }

  Widget myButton(String text, Color bgcolor, Color textColor, BuildContext context, String option) {
    return ElevatedButton(
      onPressed:(){
        if (option=='signin')
          {
             signin(context);
          }
        else
          {
            signup(context);
          }
      }
      ,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgcolor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
        padding: EdgeInsets.symmetric(vertical: 14.h),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60.h),

                SizedBox(
                  height: 400.h,
                  child: Image.asset('assets/start_screen.png'),
                ),

                SizedBox(height: 10.h),

                Text(
                  "The only study app you'll ever need",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 16.h),

                Text(
                  "Platform that empowers individuals to upload class study materials, create electronic flashcards to study.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                  ),
                ),

                SizedBox(height: 50.h),

                Column(
                  children: [
                    myButton("Create new account", Color(0xFF7658F8), Colors.black,context,'signup'),
                    SizedBox(height: 12.h),
                    myButton("I already have an account", Colors.black, Colors.white,context,'signin'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


