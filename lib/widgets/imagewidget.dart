import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Widget"),
      ),
      body: Center(
        child: Container(
          height: 350,
          width: 350,
          // color: Colors.red,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(blurRadius: 10, color: Colors.black, spreadRadius: 5)
              ],
              borderRadius: BorderRadius.circular(20),
              // image: const DecorationImage(
              //     image: NetworkImage(
              //       "https://www.arweave.net/HMPNRDPf2pY5F8HfImUe3Cs1sfHDrZKDykhjy0iFee4?ext=jpg",
              //     ),
              //     fit: BoxFit.cover),
              image: const DecorationImage(
                  image: AssetImage('assets/cover.jpg'), fit: BoxFit.cover)),
          // child: Image.network(
          //   "https://www.arweave.net/HMPNRDPf2pY5F8HfImUe3Cs1sfHDrZKDykhjy0iFee4?ext=jpg",
          //   fit: BoxFit.cover,
          // ),
        ),
      ),
    );
  }
}
