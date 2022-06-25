import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../utils/routes/routes.gr.dart';
import '../widgets/vertical_space.dart';
import 'widgets/class_list.dart';
import 'widgets/date_picker.dart';
import 'widgets/search_bar.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({
    Key? key,
    required this.classType,
  }) : super(key: key);

  final String classType;

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.classType} Class')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SearchBar(),
            const VerticalSpace(height: 10),
            DatePicker(
              onPressed: (int idx) {
                index = idx;
              },
            ),
            const VerticalSpace(height: 10),
            Expanded(
              child: ClassList(
                onTap: () {
                  context.router.navigate(
                    ClassDetailRoute(
                      classType: widget.classType,
                    ),
                  );
                },
                classType: widget.classType,
                location: widget.classType == 'online'
                    ? 'Streaming - Zoom'
                    : 'Gym Studio - Bandung',
                index: index,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
