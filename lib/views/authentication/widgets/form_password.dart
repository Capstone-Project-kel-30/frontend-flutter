import 'package:flutter/material.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

class FormPassword extends StatelessWidget {
  const FormPassword({
    Key? key,
    required this.title,
    required this.hint,
    required this.controller,
  }) : super(key: key);
  final String title, hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              suffixIcon: const Icon(
                Icons.visibility_off,
                color: kGreyColor,
              ),
              hintText: hint,
              hintStyle: const TextStyle(fontSize: 12),
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
