import 'package:flutter/material.dart';

class AppWidget{

  static TextStyle boldTextFeildStyle(){
    return  TextStyle(
          color: Colors.black,
           fontSize: 20.0,
            fontWeight: FontWeight.bold, fontFamily: 'Poppins');
     }
  static TextStyle headerTextFeildStyle(){
    return  TextStyle(
          color: Colors.black,
           fontSize: 24.0,
            fontWeight: FontWeight.bold, fontFamily: 'Poppins');
     }

     static TextStyle LightTextFeildStyle(){
    return  TextStyle(
          color: Colors.black38,
           fontSize: 15.0,
            fontWeight: FontWeight.w500, fontFamily: 'Poppins');
     }

      static TextStyle SemiBoldTextFeildStyle(){
    return  TextStyle(
          color: Colors.black,
           fontSize: 16.0,
            fontWeight: FontWeight.w500, fontFamily: 'Poppins');
     }
}