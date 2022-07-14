import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../service/searcing/searcing.dart';

class Search extends SearchDelegate {
  final Statevariable statevariable = Get.put(Statevariable());
  List<String> data = [
    "honda",
    "suzuki",
    "kawasaki",
    "yamaha",
  ];
  List<String> research = [
    "suzuki",
    "kawasaki",
    "yamaha",
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  ////aksii searchh
  @override
  Widget buildResults(BuildContext context) async {
    // TODO: implement buildResults
    List<Search> data = [];
    var search = Searchserv();
    search.search("haii").then((v) {
      v.datasearch?.forEach((vl) {});
    });
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("sasasa"),
        );
      },
    );
    // var search = Searchserv();

    // search.search("haii").then((v) {
    //   return lis
    // });

    // if (query != null && data.contains(query.toLowerCase())) {
    //   return ListTile(
    //     title: Text(query),
    //     onTap: () {
    //       print("assiii111");
    //     },
    //   );
    // } else {
    //   return ListTile(
    //     title: Text("No resoult found"),
    //     onTap: () {
    //       print("assiii");
    //     },
    //   );
    // }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    return ListView.builder(
        itemCount: research.length,
        itemBuilder: (cntext, index) {
          return ListTile(
            title: Text(research[index]),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              print("assiii22");
            },
          );
        });
  }
}
