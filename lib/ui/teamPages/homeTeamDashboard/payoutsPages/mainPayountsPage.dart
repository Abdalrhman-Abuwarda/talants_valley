import 'package:flutter/material.dart';

class MainPayoutsPage extends StatelessWidget {
  const MainPayoutsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payouts"),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Text("This is main payounts page"),
      ),
    );
  }
}
