import 'package:flutter/material.dart';
import 'package:form_validation/gallery.dart';
import 'package:form_validation/signUp_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanchez, Hans Zin Activity',
      debugShowCheckedModeBanner: false,
      /* home: SignUp(), */
      home: Gallery(),
    );
  }
}
