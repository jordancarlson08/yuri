import 'package:yuri/examples/models/models.dart';
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
    final theme = Theme.of(context);

    var widgets = <Widget>[];
    widgets.add(Padding(
      padding: const EdgeInsets.only(top: 32, left: 24.0),
      child: Text(
        category.name,
        style: TextStyle(
            color: theme.colorScheme.tertiary,
            fontSize: 13,
            fontWeight: FontWeight.bold),
      ),
    ));
    category.uris.asMap().forEach((index, uri) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(
              top: 16.0, bottom: 16.0, left: 24.0, right: 24.0),
          child: Card(
            child: InkWell(
              onTap: () async {
                await launch(uri.uri);
              },
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            uri.label,
                            style: TextStyle(
                                color: theme.colorScheme.primary,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            uri.uri,
                            style: TextStyle(
                                color: theme.colorScheme.secondary,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      if (index + 1 < category.uris.length) {
        widgets.add(Divider(
          thickness: 1,
          color: theme.colorScheme.inverseSurface,
        ));
      }
    });

    return widgets;
  }
}
