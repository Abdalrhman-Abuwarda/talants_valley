import 'package:flutter/material.dart';

class MainAnalyticsPage extends StatelessWidget {
  const MainAnalyticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analytics"),
        backgroundColor: Colors.transparent,
      ),
      body: const Center(
        child: Text("This is Main Analytics Page"),
      ),
    );
  }
}
