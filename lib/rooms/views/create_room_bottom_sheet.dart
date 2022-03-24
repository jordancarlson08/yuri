import 'package:flutter/material.dart';
import 'package:yuri/theme/extensions.dart';

const title = 'Create a custom room';
const cta = 'Create room';
const roomNameHint = 'Room name';
const roomDescriptionHint = 'Room description (optional)';

Future<T?> showCreateRoomBottomSheet<T>(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: createRoomBottomSheetContents(context)));
    },
  );
}

Padding createRoomBottomSheetContents(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 24.0),
    child: Wrap(children: [
      Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: context.theme.textTheme.headlineSmall?.copyWith(
                color: context.theme.colorScheme.onBackground,
              ),
            ),
          ),
          //icon
          Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "🏓",
                    style: context.theme.textTheme.displaySmall?.copyWith(
                      color: context.theme.colorScheme.onBackground,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: TextField(
              style: context.theme.textTheme.headlineSmall?.copyWith(
                color: context.theme.colorScheme.primary,
              ),
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                hintText: roomNameHint,
                hintStyle: context.theme.textTheme.headlineSmall?.copyWith(
                  color: context.theme.disabledColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: TextField(
              style: context.theme.textTheme.titleMedium?.copyWith(
                color: context.theme.colorScheme.primary,
              ),
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                hintText: roomDescriptionHint,
                hintStyle: context.theme.textTheme.titleMedium?.copyWith(
                  color: context.theme.disabledColor,
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 56.0,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                cta,
                style: context.theme.textTheme.titleMedium
                    ?.copyWith(color: context.theme.colorScheme.onPrimary),
              ),
            ),
          ),
        ],
      ),
    ]),
  );
}
