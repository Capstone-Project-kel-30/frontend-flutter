import 'package:flutter/material.dart';

import '../../utils/themes/app_theme.dart';
import 'vertical_space.dart';

class FormUsername extends StatelessWidget {
  const FormUsername({
    Key? key,
    required this.title,
    required this.hint,
    required this.controller,
    this.validator,
    this.keyboard,
  }) : super(key: key);
  final String title, hint;
  final TextEditingController controller;

  final String? Function(String?)? validator;
  final TextInputType? keyboard;

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
        const VerticalSpace(height: 8),
        SizedBox(
          child: TextFormField(
            validator: validator,
            keyboardType: keyboard,
            controller: controller,
            decoration: InputDecoration(
              errorStyle: AppTheme.theme(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Colors.red),
              contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              hintText: hint,
              hintStyle: const TextStyle(
                  fontSize: 12, color: kGreyColor, fontWeight: kMediumWeight),
              fillColor: kDarkColor,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: kGreyColor,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
