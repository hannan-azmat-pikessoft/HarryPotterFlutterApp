import 'package:flutter/material.dart';

class SnackBarWidget extends StatelessWidget {
  const SnackBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Snack Bar'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              final snackbar = SnackBar(
                // padding: const EdgeInsets.all(5),
                action: SnackBarAction(
                  label: "Undo",
                  textColor: Colors.white,
                  onPressed: () {},
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                behavior: SnackBarBehavior.floating,
                content: const Text(
                  "Snack bar is showing",
                  style: TextStyle(color: Colors.white),
                ),
                duration: const Duration(seconds: 5),
                backgroundColor: Colors.amber,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            },
            child: const Text("Show Snackbar")),
      ),
    );
  }
}
