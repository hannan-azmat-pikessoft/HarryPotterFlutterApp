import 'package:flutter/material.dart';

class DismissibleWidget extends StatefulWidget {
  const DismissibleWidget({super.key});

  @override
  State<DismissibleWidget> createState() => _DismissibleWidgetState();
}

class _DismissibleWidgetState extends State<DismissibleWidget> {
  List<String> fruits = ['orange', 'banana', 'apple', 'mango', 'grape', 'pear'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dismissible Widget")),
      body: ListView.builder(
          itemCount: fruits.length,
          itemBuilder: (context, index) {
            // return Card(child: ListTile(title: Text(fruits[index])));
            final fruit = fruits[index];
            return Dismissible(
                onDismissed: (direction) {
                  if (direction == DismissDirection.startToEnd) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          fruits[index] + " is dimissed",
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          fruits[index] + " is archived",
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.green));
                  }
                },
                key: Key(fruit),
                background: Container(color: Colors.red),
                secondaryBackground: Container(color: Colors.green),
                child: Card(
                    child: ListTile(
                  title: Text(fruits[index]),
                )));
          }),
    );
  }
}
