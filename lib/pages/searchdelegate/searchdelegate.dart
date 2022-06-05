import 'package:flutter/material.dart';

class Search extends SearchDelegate {
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
    return <Widget>[IconButton(onPressed: () {}, icon: Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    if (query != null && data.contains(query.toLowerCase())) {
      return ListTile(
        title: Text(query),
        onTap: () {},
      );
    } else {
      return ListTile(
        title: Text("No resoult found"),
        onTap: () {},
      );
    }
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
            onTap: () {},
          );
        });
  }
}
