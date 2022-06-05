import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Urllauch extends StatefulWidget {
  const Urllauch({Key? key, required this.icon, required this.title})
      : super(key: key);
  final icon;
  final title;

  @override
  State<Urllauch> createState() => _UrllauchState();
}

class _UrllauchState extends State<Urllauch> {
  var _url = "https://wa.me/+627865537114";
  void _launchUrl() async {
    var lauch = launchUrl(Uri.parse(_url));
  }

  Future whatsapp(String number) async {
    var url = "https://wa.me/" + number + '?text=Bukti Pembayaran: ';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'tidak dapat membuka $url';
    }
  }

  Future email(String email) async {
    await launch("mailto:$email");
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.title == "Whatshapp") {
          whatsapp("+6287865537114");
        } else {
          email("jekomontainugrah@gmail.com");
        }
      },
      child: Container(
          child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.width / 7,
            width: MediaQuery.of(context).size.width / 7,
            child: widget.icon,
          ),
          Text("Whatshapp")
        ],
      )),
    );
  }
}
