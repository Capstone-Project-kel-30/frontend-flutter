import 'package:flutter/material.dart';

class ClassPage extends StatelessWidget {
  const ClassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            Text('Class Under Development'),
          ],
        ),
      ),
    );
  }
}
