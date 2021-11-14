import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double defaultPadding = 16.0;
const Duration defaultDuration = Duration(milliseconds: 300);

const inputDecoration = InputDecoration(
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    fillColor: Colors.white,
    hintStyle: TextStyle(color: Colors.grey));

InputDecoration txtFormField = InputDecoration(
    labelText: "Enter Email",
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(),
    ));

TextStyle txtGF = GoogleFonts.paytoneOne(
    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);

const txtStyle2 = TextStyle(
  fontSize: 24,
);
