import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';
import '../../widgets/cutom_elevated_button.dart';
import '../../widgets/vertical_space.dart';

class CarouselImageCard extends StatelessWidget {
  const CarouselImageCard({
    Key? key,
    required this.img,
    required this.textList,
    required this.onPressed,
  }) : super(key: key);

  final String img;
  final List<String> textList;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (shade) {
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.black.withOpacity(0.7),
                Colors.transparent,
              ],
            ).createShader(shade);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              img,
              fit: BoxFit.cover,
              height: 166,
            ),
          ),
        ),
        Center(
          child: SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: textList[0] != '',
                    child: Column(
                      children: [
                        Text(
                          textList[0],
                          style: AppTheme.theme(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                fontSize: 10,
                                fontWeight: kMediumWeight,
                                color: kLightColor,
                              ),
                        ),
                        const VerticalSpace(height: 10),
                      ],
                    ),
                  ),
                  Text(
                    textList[1],
                    style:
                        AppTheme.theme(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 18,
                              fontWeight: kBoldWeight,
                              color: kLightColor,
                            ),
                  ),
                  const VerticalSpace(height: 10),
                  Text(
                    textList[2],
                    style:
                        AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                              fontSize: 10,
                              fontWeight: kMediumWeight,
                              color: kLightColor,
                            ),
                  ),
                  const VerticalSpace(height: 10),
                  CustomElevatedButton(
                    text: textList[3],
                    radius: 100,
                    fontSize: 10,
                    width: null,
                    height: 22,
                    fontWeight: kBoldWeight,
                    onPressed: onPressed,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
