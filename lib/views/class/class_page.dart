import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/class_model.dart';
import '../../models/user_model.dart';
import '../../utils/common/helper.dart';
import '../widgets/vertical_space.dart';
import 'widgets/class_list.dart';
import 'widgets/date_picker.dart';
import 'widgets/search_bar.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({
    Key? key,
    required this.classType,
    required this.user,
    required this.classes,
  }) : super(key: key);

  final String classType;
  final ClassModel classes;
  final UserModel user;

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  List<Class> classList = [];

  @override
  void initState() {
    super.initState();
    final currentDate = DateTime.now();
    final dateFormatter = DateFormat('d-M-y');
    final current = dateFormatter.format(currentDate);
    classList = widget.classes.data!
        .where((element) => element.date == current)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${capitalize(widget.classType)} Class')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SearchBar(),
            const VerticalSpace(height: 10),
            DatePicker(
              onPressed: (String datePicked) {},
            ),
            const VerticalSpace(height: 10),
            Expanded(
              child: ClassList(
                user: widget.user,
                classList: classList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
