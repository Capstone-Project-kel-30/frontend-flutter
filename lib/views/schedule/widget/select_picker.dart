import 'package:flutter/material.dart';
import 'package:workout_zone/views/widgets/select_button.dart';

class SelectPicker extends StatefulWidget {
  const SelectPicker({
    Key? key,
    required this.onprees,
  }) : super(key: key);

  final Function(String selectedType) onprees;

  @override
  State<SelectPicker> createState() => _SelectPickerState();
}

class _SelectPickerState extends State<SelectPicker> {
  int selectActive = 0;

  List<String> select = [
    'All',
    'Offline',
    'Online',
  ];
  List<String> logoSelect = [
    "",
    "assets/icons/ph_barbell.svg",
    "assets/icons/Online prediction.svg",
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              right: 2,
            ),
            child: Row(
              children: [
                SelectButton(
                  title: select[index],
                  ontap: () {
                    setState(
                      () {
                        selectActive = index;
                      },
                    );
                    widget.onprees(select[index]);
                  },
                  isActive: selectActive == index,
                  logo: logoSelect[index],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
