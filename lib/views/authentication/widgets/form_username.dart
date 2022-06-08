import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';
import '../../widgets/vertical_space.dart';

class FormUsername extends StatelessWidget {
  const FormUsername({
    Key? key,
    required this.title,
    required this.hint,
    required this.controller,
    required this.color,
  }) : super(key: key);
  final String title, hint;
  final TextEditingController controller;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VerticalSpace(height: 10),
        Text(
          title,
          style: const TextStyle(fontWeight: kSemiBoldWeight, fontSize: 14),
        ),
        const VerticalSpace(height: 4),
        SizedBox(
          height: 45,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              hintText: hint,
              hintStyle: TextStyle(fontSize: 10, color: color),
              fillColor: kDarkColor,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: kGreyColor,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
