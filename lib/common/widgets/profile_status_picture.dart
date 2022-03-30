import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:yuri/common/widgets/circle.dart';
import 'package:yuri/common/widgets/profile_picture.dart';
import 'package:yuri/common/widgets/squircle.dart';
import 'package:yuri/theme/extensions.dart';

import '../../theme/colors.dart';

final log = Logger('ProfileStatusPicture');

//TODO should the state of these widgets be handled by a BLoC? Probably
// does that mean there will be a instance of a bloc per person?
// nah just a list of persons and their state?
class ProfileStatusPicture extends StatefulWidget {
  const ProfileStatusPicture({
    Key? key,
    required this.height,
    this.url,
    this.activity = ActivityIndicatorStatus.unknown,
    this.status = const DisplayStatus(StatusType.none, null),
  }) : super(key: key);

  final double height;
  final String? url;
  final ActivityIndicatorStatus activity;
  final DisplayStatus status;

  @override
  State<ProfileStatusPicture> createState() => _ProfileStatusPictureState();
}

class _ProfileStatusPictureState extends State<ProfileStatusPicture> {
  //TODO replace with data from Bloc State
  final status = ActivityIndicatorStatus.active;
  final displayStatus = const DisplayStatus(StatusType.emoji, null);

  @override
  Widget build(BuildContext context) {
    final width = widget.height * 0.8;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        ProfilePicture(
          height: widget.height,
          url: widget.url,
        ),
        _activityIndicator(context, status, width),
        _displayStatus(context, displayStatus, width),
      ],
    );
  }

  Widget _activityIndicator(
      BuildContext context, ActivityIndicatorStatus status, double width) {
    final activityIndicatorSize = width / 4;
    final activityIndicatorPadding = activityIndicatorSize / 4;
    final activityIndicatorOffset = activityIndicatorPadding / 2;

    var visiblity = true;

    if (status == ActivityIndicatorStatus.unknown) {
      visiblity = false;
    }

    final indicatorColor = status == ActivityIndicatorStatus.active
        ? HeyFamStaticColors.green
        : HeyFamStaticColors.yellow;

    return Visibility(
      visible: visiblity,
      child: Positioned(
          top: -activityIndicatorOffset,
          right: -activityIndicatorOffset,
          child: Circle(
            color: context.theme.colorScheme.background,
            size: activityIndicatorSize + activityIndicatorPadding,
            child: Circle(
              color: indicatorColor,
              size: activityIndicatorSize,
            ),
          )),
    );
  }

  Widget _displayStatus(
    BuildContext context,
    DisplayStatus status,
    double width,
  ) {
    switch (status.type) {
      case StatusType.none:
        return const SizedBox(width: 0, height: 0);
      case StatusType.add:
        return _squircleAdd(context, width);
      case StatusType.emoji:
        return _emojiStatus(context, width);
      case StatusType.picture:
        return Container();
    }
  }

  Widget _squircleAdd(BuildContext context, double width) {
    final outerSquircleSize = width / 2;
    final innerSquircleSize = width / 2.4;
    final padding = (outerSquircleSize - innerSquircleSize) / 2;
    final offset = -(padding * 3);

    return Positioned(
      bottom: offset,
      right: offset,
      child: SizedBox(
        width: outerSquircleSize,
        height: outerSquircleSize,
        child: Material(
          shape: SquircleBorder(
              side: BorderSide(
            color: context.theme.colorScheme.background,
            width: padding,
          )),
          color: context.theme.colorScheme.primary,
          child: Icon(
            Icons.add,
            size: innerSquircleSize,
            color: context.theme.colorScheme.background,
          ),
        ),
      ),
    );
  }

  Widget _emojiStatus(BuildContext context, double width) {
    final emojiSize = width / 4;
    final rounding = emojiSize / 2;
    final padding = emojiSize / 3;
    final offset = -padding * 1.5;

    log.fine('$emojiSize; $padding; $offset');

    return Positioned(
      bottom: offset,
      right: offset,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: width / 2,
            height: width / 2,
            child: Card(
              color: context.theme.colorScheme.background,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(rounding),
                ),
              ),
            ),
          ),
          Card(
            color: context.theme.colorScheme.onBackground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(rounding),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Text(
                "😇",
                style: context.theme.textTheme.bodyMedium?.copyWith(
                  fontSize: emojiSize,
                  height: 1.0,
                  color: context.theme.colorScheme.onBackground,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum ActivityIndicatorStatus { unknown, active, inactive }

enum StatusType { none, add, emoji, picture }

class DisplayStatus {
  const DisplayStatus(this.type, this.data);

  final StatusType type;
  final String? data;
}
