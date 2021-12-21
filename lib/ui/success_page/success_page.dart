import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success page'),
      ),
      body: const Center(
        child: Icon(Icons.check),
      ),
    );
  }
}
