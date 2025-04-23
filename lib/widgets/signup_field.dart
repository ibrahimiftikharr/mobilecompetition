import 'package:flutter/material.dart';


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
          borderSide: BorderSide(color: Color(0xFF7658F8),width: 2)
      ),
    ),
  );
}