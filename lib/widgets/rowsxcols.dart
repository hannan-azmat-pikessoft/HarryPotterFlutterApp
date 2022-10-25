import 'package:flutter/material.dart';

class RowsXCols extends StatelessWidget {
  const RowsXCols({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rows and Cols"),
      ),
      body: Container(
        height: w,
        width: h,
        color: Colors.amber,
        child: Wrap(
          // Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              color: Colors.green,
            ),
            Container(
              height: 60,
              width: 60,
              color: Colors.white,
            ),
            Container(
              height: 60,
              width: 60,
              color: Colors.purple,
            ),
            Container(
              height: 60,
              width: 60,
              color: Colors.black,
            )
          ],
          // ),
        ),
      ),
    );
  }
}
