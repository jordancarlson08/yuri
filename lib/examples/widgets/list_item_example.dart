import 'package:yuri/examples/models/models.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme/colors.dart';

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
    var widgets = <Widget>[];
    widgets.add(Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Text(
        category.name,
        style: const TextStyle(
            color: YuriColors.beigeAlt,
            fontSize: 13,
            fontWeight: FontWeight.bold),
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
                    color: Theme.of(context).primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                text: uri.label + "\n",
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    await launch(uri.uri);
                  }),
            TextSpan(
                style: const TextStyle(
                    color: YuriColors.tealAlt,
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
        widgets.add(const Divider(
          thickness: 1,
          color: YuriColors.beige,
        ));
      }
    });

    return widgets;
  }
}
