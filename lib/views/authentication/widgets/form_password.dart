import 'package:flutter/material.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

class FormPassword extends StatefulWidget {
  const FormPassword({
    Key? key,
    required this.title,
    required this.hint,
    required this.controller,
  }) : super(key: key);
  final String title, hint;
  final TextEditingController controller;

  @override
  State<FormPassword> createState() => _FormPasswordState();
}

class _FormPasswordState extends State<FormPassword> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontWeight: kSemiBoldWeight, fontSize: 14),
        ),
        const VerticalSpace(height: 4),
        SizedBox(
          height: 45,
          child: TextFormField(
            obscureText: _hidePassword,
            controller: widget.controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _hidePassword = !_hidePassword;
                  });
                },
                child: Icon(
                    _hidePassword ? Icons.visibility : Icons.visibility_off),
              ),
              hintText: widget.hint,
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
