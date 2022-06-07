import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';
import '../../widgets/vertical_space.dart';

class FormUsername extends StatelessWidget {
  const FormUsername({
    Key? key,
    required this.title,
    required this.hint,
  }) : super(key: key);
  final String title, hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: kSemiBoldWeight, fontSize: 12),
        ),
        const VerticalSpace(height: 4),
        SizedBox(
          height: 45,
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              hintText: hint,
              hintStyle: const TextStyle(fontSize: 10),
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
