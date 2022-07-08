import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';
import '../../widgets/custom_network_image.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    required this.link,
    required this.title,
  }) : super(key: key);

  final String link, title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) {
              return LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  kPrimaryColor.withOpacity(0.5),
                  Colors.transparent,
                ],
              ).createShader(bounds);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CustomNetworkImage(
                link: link,
                height: 100,
                width: 150,
                color: kDarkColor,
                iconErrorColor: kLightColor,
              ),
            ),
          ),
          Positioned.fill(
            bottom: 15,
            left: 10,
            right: 10,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                      color: kLightColor,
                      fontWeight: kSemiBoldWeight,
                    ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
