import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


TextFormField reusableTextFormField({required TextEditingController textController, required String text, required IconData icon, required bool isPasswordType}){
  return TextFormField(
    controller: textController,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.black,
    style: const TextStyle(color: Colors.black),
    decoration: InputDecoration(prefixIcon: Icon(icon, color: Colors.grey.shade700,),
    labelText: text,
    labelStyle:  TextStyle(color: Colors.grey.shade700),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor:  Colors.grey.shade200.withOpacity(0.7),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide:  BorderSide(width: 0.5,  color: Colors.grey.shade800)
      ),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide:  BorderSide(width: 0.5,  color: Colors.grey.shade800)
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide:  BorderSide(width: 0.5,  color: Colors.grey.shade800)
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide:  BorderSide(width: 0.5, color: Colors.grey.shade800)
      ),


    ),
    keyboardType: isPasswordType ?  TextInputType.visiblePassword : TextInputType.text,
  );
}