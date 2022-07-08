import 'package:flutter/material.dart';
import 'package:audiocalculator/bg_store.dart';
import 'package:audiocalculator/calFarm.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
    home:Farm(),
  );
}
