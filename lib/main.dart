import 'package:flutter/material.dart';
import 'package:netnflix/cust_class.dart';
import 'package:netnflix/pages/login_page.dart';

void main(List<String> args) {
  runApp(const NeTNflix());
}

class NeTNflix extends StatelessWidget {
  const NeTNflix({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      title: "NeTNflix",
      theme: ThemeData(
        primarySwatch: CustClass.customBlack,
        colorScheme: const ColorScheme.dark(),
        fontFamily: 'netnflix'
      ),
      home: const LoginPage(),
    );
  }
}
