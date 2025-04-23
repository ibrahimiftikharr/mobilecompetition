import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:theloanapp/widgets/scaffold.dart';

class AuthService {
  static final FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  final FirebaseFirestore firestore=FirebaseFirestore.instance;


  Future<User?> signUpWithEmail(String email, String password, String role, BuildContext context) async {
    try {

      email=email.trim();
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      print('THE USER CREATED IS $user');

      if (user != null) {
        await firestore.collection('users').doc(user.uid).set({
          'email': email,
          'role': role,
        });
      }
      return user;
    } catch (e) {
      print("SIGNUP ERROR: ${e.toString()}");
      scaffold(e.toString(), context);
      return null;
    }
  }


  Future<User?> signInWithEmail(String email,String password) async
  {
    email=email.trim();

    try
    {
      UserCredential userCredential=await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;

    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }


  static Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
      print('User logged out successfully');
    } catch (e) {
      print('Error logging out: $e');
    }
  }
}