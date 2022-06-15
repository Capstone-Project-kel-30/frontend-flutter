import 'package:flutter/material.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

class FormPassword extends StatefulWidget {
  const FormPassword({
    Key? key,
    required this.title,
    required this.hint,
    required this.controller,
    required this.validator,
  }) : super(key: key);
  final String title, hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;

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
        const VerticalSpace(height: 10),
        Text(
          widget.title,
          style: const TextStyle(fontWeight: kSemiBoldWeight, fontSize: 14),
        ),
        const VerticalSpace(height: 8),
        SizedBox(
          child: TextFormField(
            validator: widget.validator,
            obscureText: _hidePassword,
            controller: widget.controller,
            decoration: InputDecoration(
              errorStyle: AppTheme.theme(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Colors.red),
              contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _hidePassword = !_hidePassword;
                  });
                },
                child: Icon(
                  _hidePassword ? Icons.visibility_off : Icons.visibility,
                ),
              ),
              hintText: widget.hint,
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
                borderSide: BorderSide(color: Colors.red),
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
