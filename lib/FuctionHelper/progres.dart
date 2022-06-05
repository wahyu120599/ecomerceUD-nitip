import 'package:flutter/material.dart';

show(context) {
  return showDialog(
    context: context,
    builder: (context) => Center(
      child: Container(
        // color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 50.0, height: 50.0, child: CircularProgressIndicator()),
          ],
        ),
      ),
    ),
  );
}
