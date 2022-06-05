import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Crosell extends StatefulWidget {
  const Crosell({
    Key? key,
  }) : super(key: key);

  @override
  State<Crosell> createState() => _CrosellState();
}

class _CrosellState extends State<Crosell> {
  final List<String> crosel = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTROu-8yp9z8EsX85QV-n3DObApbbZOlyD4gg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp8_JPyDNJz4-055B47gZ_cZK345_O6LJRQw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS86HdwPynP6CVNdTcKnRsBBRgothxDiBPSig&usqp=CAU"
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height,
        autoPlay: true,
        // enlargeCenterPage: true,
        viewportFraction: 1,
      ),
      itemCount: crosel.length,
      itemBuilder: (context, index, realIdx) {
        return Container(
          // height: 300,
          width: MediaQuery.of(context).size.width,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.blue,
              image: DecorationImage(
                  image: NetworkImage(crosel[index]), fit: BoxFit.cover)),
        );
      },
    );
  }
}
