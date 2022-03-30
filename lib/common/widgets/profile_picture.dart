import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yuri/theme/extensions.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
    required this.height,
    this.url,
  }) : super(key: key);

  final double height;
  final String? url;

  @override
  Widget build(BuildContext context) {
    final width = height * 0.8;

    return ClipRRect(
      borderRadius: BorderRadius.circular(width / 2),
      child: SizedBox(
        height: height,
        width: width,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          // imageUrl: "http://via.placeholder.com/300x400",
          imageUrl: url ?? "",
          placeholder: (context, url) => Container(
            color: context.theme.primaryColor,
          ),
          errorWidget: (context, url, error) => Container(
            color: context.theme.primaryColor,
          ),
        ),
      ),
    );
  }
}
