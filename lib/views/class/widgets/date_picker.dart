import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utils/themes/app_theme.dart';
import 'date_button.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key, required this.onPressed}) : super(key: key);

  final Function(int idx) onPressed;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final DateTime current = DateTime.now();
  final DateFormat dayFormatter = DateFormat('E');
  final DateFormat dateFormatter = DateFormat('d');
  final DateFormat fullDataFormatter = DateFormat('d-M');

  List<String> fullData = [];
  List<String> days = [];
  List<String> dates = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 7; i++) {
      final day = current.add(Duration(days: i));
      fullData.add(fullDataFormatter.format(day));
      days.add(dayFormatter.format(day));
      dates.add(dateFormatter.format(day));
    }
  }

  int dateActived = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Card(
        shadowColor: kLightColor,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 5),
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            itemBuilder: (context, idx) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: DateButton(
                  isActive: dateActived == idx,
                  day: days[idx],
                  date: dates[idx],
                  onTap: () {
                    setState(() {
                      dateActived = idx;
                    });
                    widget.onPressed(idx);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
