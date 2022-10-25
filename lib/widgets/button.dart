import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  void _buttonClick() {
    print("like");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Button"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all((const EdgeInsets.all(10))),
                  overlayColor: MaterialStateProperty.all(Colors.black),
                  elevation: MaterialStateProperty.all(10),
                  backgroundColor: MaterialStateProperty.all((Colors.yellow))),
              onPressed: _buttonClick,
              child: const Text("Click me",
                  style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)))),
                onPressed: _buttonClick,
                child: const Text(
                  "Click me",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
