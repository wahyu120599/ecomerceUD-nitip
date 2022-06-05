import 'package:flutter/material.dart';
import 'package:udmurahmotor/FuctionHelper/appbar.dart';

class Kategori extends StatefulWidget {
  const Kategori({Key? key}) : super(key: key);

  @override
  State<Kategori> createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  @override
  Widget build(BuildContext context) {
    var Mediaquerywidth = MediaQuery.of(context).size.width;
    var Mediaqueryhight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appbar(context, Mediaquerywidth, Mediaqueryhight, false),
      body: Container(
        padding: EdgeInsets.only(left: 15),
        width: Mediaquerywidth,
        height: Mediaqueryhight,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Text(
                "Kategori : Honda",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            // Container(
            //   width: Mediaquerywidth,
            //   height: Mediaqueryhight / 19,
            //   child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: 5,
            //       itemBuilder: (context, index) {
            //         return Container(
            //           margin: EdgeInsets.only(left: 5, right: 5),
            //           padding: EdgeInsets.only(
            //               top: 3, bottom: 3, right: 30, left: 30),
            //           decoration: BoxDecoration(
            //               color: Colors.black,
            //               borderRadius: BorderRadius.circular(5)),
            //           child: Center(
            //             child: Text(
            //               "Honda",
            //               style: TextStyle(color: Colors.white),
            //             ),
            //           ),
            //         );
            //       }),
            // ),
            Container(
              margin: EdgeInsets.only(top: 20, right: 12),
              width: Mediaquerywidth,
              height: Mediaqueryhight / 1.2,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3.2 / 5,
                      // childAspectRatio: 3 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: 10,
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/Details',
                            arguments: {"name": "yamaha Nmex 155"});
                      },
                      child: Card(
                        child: Container(
                          width: Mediaquerywidth / 2,
                          height: Mediaqueryhight / 3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYOW9RoNBkfrCFBoNCeso9fYiDjnxosTYfYg&usqp=CAU"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  width: Mediaquerywidth,
                                  padding: EdgeInsets.only(top: 15, left: 7),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(bottom: 15),
                                          child: Text(
                                            "YAMAHA Nmax 155",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Text(
                                        "Rp.30.200.00",
                                        style: TextStyle(
                                            color: Colors.amber,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
