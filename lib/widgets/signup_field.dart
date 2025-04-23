import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Widget CustomField(String hint, bool hide, TextEditingController controller)
{
  return TextField(
    controller: controller,
    obscureText: hide,
    decoration: InputDecoration(
      hintText: hint,
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey)
      ),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.lightGreen,width: 2)
      ),
    ),
  );
}