import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:workout_zone/utils/themes/app_theme.dart';

class FormKotak extends StatelessWidget {
  const FormKotak({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController formKotak = TextEditingController();
    return Container(
      color: kLightColor,
      width: 50,
      height: 58,
      child: TextFormField(
        controller: formKotak,
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
        style: AppTheme.theme(context).textTheme.titleLarge,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: const InputDecoration(
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
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
