import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/themes/app_theme.dart';
import '../../widgets/horizontal_space.dart';

class VideoImageCard extends StatelessWidget {
  const VideoImageCard({
    Key? key,
    required this.asset,
    required this.title,
  }) : super(key: key);

  final String asset, title;

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
              child: Image.asset(
                asset,
                fit: BoxFit.cover,
                height: 100,
                width: 210,
              ),
            ),
          ),
          Positioned.fill(
            bottom: 15,
            left: 10,
            right: 10,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style:
                          AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                                color: kLightColor,
                                fontWeight: kSemiBoldWeight,
                              ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  const HorizontalSpace(width: 5),
                  SvgPicture.asset(
                    'assets/icons/Play-Fill.svg',
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
