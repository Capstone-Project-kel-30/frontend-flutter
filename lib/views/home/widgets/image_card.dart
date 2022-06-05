import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
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
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              asset,
              fit: BoxFit.cover,
              height: 100,
              width: 150,
            ),
          ),
          Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.transparent,
                ],
              ),
              borderRadius: BorderRadius.circular(10),
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
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
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
