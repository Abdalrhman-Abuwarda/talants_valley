import 'package:flutter/material.dart';

class MainHelpFreelancerPage extends StatelessWidget {
  const MainHelpFreelancerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help"),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children:const [
          Center(child: Text("This is Home Balance Page"),)
        ],
      ),
    );
  }
}
