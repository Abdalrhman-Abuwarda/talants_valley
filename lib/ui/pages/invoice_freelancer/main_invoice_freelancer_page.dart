import 'package:flutter/material.dart';

class MainInvoiceFreeLancerPage extends StatelessWidget {
  const MainInvoiceFreeLancerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Invoice"),
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
