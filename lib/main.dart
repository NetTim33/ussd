import 'package:flutter/material.dart';
import 'package:ussd/beeline.dart';
import 'package:ussd/mubiuz.dart';
import 'package:ussd/ucell.dart';
import 'package:ussd/uzmobile.dart';


void main() {
  runApp(
    const MaterialApp(
      title: "USSD",
      debugShowCheckedModeBanner: false,
      home: Ucell(),
    ),
  );
}
