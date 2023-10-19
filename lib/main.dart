import 'package:flutter/material.dart';
import 'package:flutter_api/example_four.dart';
import 'package:flutter_api/example_two.dart';
import 'package:flutter_api/home_screen.dart';

import 'package:flutter_api/example_three.dart';
import 'package:flutter_api/lastexample_screen.dart';
import 'package:flutter_api/signup.dart';
import 'package:flutter_api/upload_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
   home: const UploadImageScreen(),

    );
  }
}
