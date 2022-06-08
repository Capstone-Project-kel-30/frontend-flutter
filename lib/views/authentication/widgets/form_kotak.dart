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
    return SizedBox(
      width: 50,
      height: 50,
      child: TextFormField(
        controller: formKotak,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        style: AppTheme.theme(context).textTheme.labelLarge,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kGreyColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kDarkColor,
            ),
          ),
        ),
      ),
    );
  }
}
