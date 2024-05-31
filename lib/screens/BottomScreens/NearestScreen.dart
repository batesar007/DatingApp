import 'package:flutter/material.dart';

class NearestScreen extends StatelessWidget {
  const NearestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [Text("NearestScreen")],
      )),
    );
  }
}
