import 'package:flutter/material.dart';

class ContainerSizedBox extends StatelessWidget {
  const ContainerSizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Conatiner and Sized Box"),
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(10),
        // margin: const EdgeInsets.all(10),
        width: 70,
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.amber,
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          // boxShadow: [
          //   BoxShadow(blurRadius: 20, color: Colors.black, spreadRadius: 5)
          // ]
        ),
        child: Center(
            child:
                // Text("DevTools")
                Container(
          // padding: const EdgeInsets.all(10),
          // margin: const EdgeInsets.all(10),
          color: Colors.red,
        )),
      )
          // SizedBox(
          //   child: Text(
          //     "DevTools",
          //   ),
          //   height: 60,
          //   width: 60,
          // ),
          // heightFactor: 50,
          // widthFactor: 50,
          ),
    );
  }
}
