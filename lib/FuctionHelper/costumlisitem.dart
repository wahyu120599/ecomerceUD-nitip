import 'package:flutter/material.dart';

import '../service/order/deleterder.dart';

class _VideoDescription extends StatelessWidget {
  const _VideoDescription({
    Key? key,
    required this.title,
    required this.harga,
    required this.viewCount,
  }) : super(key: key);

  final String title;
  final String harga;
  final String viewCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 8.2,
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      // color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            harga,
            style: const TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: Colors.amber),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  padding:
                      EdgeInsets.only(top: 3, bottom: 3, right: 5, left: 5),
                  decoration: BoxDecoration(),
                  child: Text(
                    '$viewCount',
                    style: const TextStyle(fontSize: 10.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomListItem extends StatefulWidget {
  const CustomListItem(
      {Key? key,
      required this.thumbnail,
      required this.title,
      required this.harga,
      required this.viewCount,
      required this.id,
      this.from,
      this.refreshfuction})
      : super(key: key);

  final Widget thumbnail;
  final String title;
  final String harga;
  final String viewCount;
  final int id;
  final from;
  final refreshfuction;

  @override
  State<CustomListItem> createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem> {
  var deleteorder = Deleteorder();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: widget.thumbnail,
          ),
          Expanded(
            flex: 3,
            child: _VideoDescription(
              title: widget.title,
              harga: widget.harga,
              viewCount: widget.viewCount,
            ),
          ),
          InkWell(
            onTap: () {
              deleteorder.deleteorders(widget.id).then((value) {
                if (value["mesage"] == "delete data sucsess") {
                  Navigator.pushReplacementNamed(context, '/Cart');
                } else {
                  print("eror");
                }
              });
            },
            child: const Icon(
              Icons.delete,
              size: 25.0,
            ),
          ),
        ],
      ),
    );
  }
}
