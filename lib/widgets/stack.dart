import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stack"),
      ),
      body: Container(
        color: Colors.blue,
        child: Center(
            child: Stack(
          children: [
            Positioned(
              bottom: 20,
              left: 20,
              child: Container(
                height: 400,
                width: 300,
                color: Colors.amber,
              ),
            ),
            Center(
              child: Container(
                height: 300,
                width: 180,
                color: Colors.red,
              ),
            ),
            Center(
              child: Container(
                height: 200,
                width: 150,
                color: Colors.green,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
