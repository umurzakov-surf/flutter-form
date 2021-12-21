import 'package:flutter/material.dart';
import 'package:flutter_form/ui/form_page/form_page.dart';

class FlutterForm extends StatelessWidget {
  const FlutterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FormPage(),
    );
  }
}