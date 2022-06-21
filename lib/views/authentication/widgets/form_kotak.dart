import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:workout_zone/utils/themes/app_theme.dart';

class FormKotak extends StatelessWidget {
  const FormKotak({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return '';
          }
          return null;
        },
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        style: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
              color: kDarkColor,
            ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.zero,
          errorStyle: TextStyle(height: 0, fontSize: 0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kGreyColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kDarkColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kRedColor,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kRedColor,
            ),
          ),
        ),
      ),
    );
  }
}
