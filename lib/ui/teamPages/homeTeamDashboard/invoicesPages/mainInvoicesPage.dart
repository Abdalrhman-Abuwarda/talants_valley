import 'package:flutter/material.dart';

class MainInvoicesPage extends StatelessWidget {
  const MainInvoicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invoices"),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Text("This is main invoices Page"),
      ),
    );
  }
}
