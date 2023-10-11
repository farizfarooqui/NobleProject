import 'package:flutter/material.dart';
import 'package:takehomeproject/api_pract.dart';
import 'package:takehomeproject/detailview.dart';
import 'package:takehomeproject/homeView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApiPract(),
    );
  }
}
