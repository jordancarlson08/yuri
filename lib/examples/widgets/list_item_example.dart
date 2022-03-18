import 'package:Yuri/examples/models/models.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExampleListItem extends StatelessWidget {
  const ExampleListItem({Key? key, required this.category}) : super(key: key);

  final UriCategory category;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: getUriWidgets(context, category));
  }

  List<Widget> getUriWidgets(BuildContext context, UriCategory category) {
    var beigeAlt = const Color(0xFFE0B49E);
    var beige = const Color(0xFFF2DFD2);
    var tealAlt = const Color(0xFF21AA8E);
    var darkGreen = const Color(0xFF024A4F);

    var widgets = <Widget>[];
    widgets.add(Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Text(
        category.name,
        style: TextStyle(
            color: beigeAlt, fontSize: 13, fontWeight: FontWeight.bold),
      ),
    ));
    category.uris.asMap().forEach((index, uri) {
      widgets.add(Padding(
        padding: const EdgeInsets.only(bottom: 16, top: 16),
        child: RichText(
            text: TextSpan(
          children: [
            TextSpan(
                style: TextStyle(
                    color: darkGreen,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                text: uri.label + "\n",
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    await launch(uri.uri);
                  }),
            TextSpan(
                style: TextStyle(
                    color: tealAlt,
                    fontSize: 13,
                    fontWeight: FontWeight.normal),
                text: uri.uri,
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    await launch(uri.uri);
                  }),
          ],
        )),
      ));
      if (index + 1 < category.uris.length) {
        widgets.add(Divider(
          thickness: 1,
          color: beige,
        ));
      }
    });

    return widgets;
  }
}
