import 'package:flutter/material.dart';

class P2PSellPage extends StatefulWidget {
  const P2PSellPage({super.key});

  @override
  State<P2PSellPage> createState() => _P2PSellPageState();
}

class _P2PSellPageState extends State<P2PSellPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Sell Grox"),
        ],
      ),
    );
  }
}