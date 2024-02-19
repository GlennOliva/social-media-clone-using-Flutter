import 'package:flutter/material.dart';

class Appbars extends StatefulWidget {
  const Appbars({super.key});

  @override
  State<Appbars> createState() => _AppbarsState();
}

class _AppbarsState extends State<Appbars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GAMCO'),
        backgroundColor: Colors.red,
      ),
    );
  }
}