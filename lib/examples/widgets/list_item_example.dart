import 'package:yuri/examples/models/models.dart';
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
      padding: const EdgeInsets.only(top: 32, left: 24.0),
      child: Text(
        category.name,
        style: const TextStyle(
            color: YuriColors.beigeAlt,
            fontSize: 13,
            fontWeight: FontWeight.bold),
      ),
    ));
    category.uris.asMap().forEach((index, uri) {
      widgets.add(
        InkWell(
          onTap: () async {
            await launch(uri.uri);
          },
          child: Padding(
            padding: const EdgeInsets.only(
                top: 16.0, bottom: 16.0, left: 24.0, right: 24.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        uri.label,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        uri.uri,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
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
