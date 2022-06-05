import 'package:flutter/material.dart';
import 'package:udmurahmotor/pages/dasboard/sidebar.dart';

import 'appbar.dart';

class Dasbord extends StatefulWidget {
  const Dasbord({Key? key}) : super(key: key);

  @override
  State<Dasbord> createState() => _DasbordState();
}

class _DasbordState extends State<Dasbord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: dsboardappbar(context),
      body: ListView(
        children: [],
      ),
    );
  }
}
