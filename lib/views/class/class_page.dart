import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/all_class/all_class_bloc.dart';
import '../../models/class_model.dart';
import '../../models/user_model.dart';
import '../widgets/shimmer_placeholder.dart';
import '../widgets/vertical_space.dart';
import 'widgets/class_list.dart';
import 'widgets/class_type_picker.dart';
import 'widgets/date_picker.dart';
import 'widgets/search_bar.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({
    Key? key,
    required this.user,
    required this.classType,
  }) : super(key: key);

  final UserModel user;
  final String classType;

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  List<Class> allClass = [];
  String datePicked = '';
  String classTypeSelected = '';

  @override
  void initState() {
    super.initState();
    context.read<AllClassBloc>().add(GetAllClass());
    final numberFormatter = NumberFormat('00');
    final currentDay = numberFormatter.format(DateTime.now().day);
    final currentMonth = numberFormatter.format(DateTime.now().month);
    final currentYear = DateTime.now().year.toString();
    datePicked = '$currentDay-$currentMonth-$currentYear';
    classTypeSelected = widget.classType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Classes')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SearchBar(),
            const VerticalSpace(height: 10),
            ClassTypePicker(
              classType: widget.classType,
              onPressed: (String classType) {
                classTypeSelected = classType;
                context.read<AllClassBloc>().add(
                      FilterClass(
                        allClass,
                        (e) {
                          return e.clastype == classType &&
                              e.date == datePicked;
                        },
                      ),
                    );
              },
            ),
            const VerticalSpace(height: 10),
            DatePicker(
              onPressed: (String date) {
                datePicked = date;
                context.read<AllClassBloc>().add(
                      FilterClass(
                        allClass,
                        (e) {
                          return e.clastype == classTypeSelected &&
                              e.date == date;
                        },
                      ),
                    );
              },
            ),
            const VerticalSpace(height: 10),
            Expanded(
              child: BlocBuilder<AllClassBloc, AllClassState>(
                builder: (context, state) {
                  if (state is AllClassLoaded) {
                    List<Class> classList = [];
                    if (state.allClass.data != null) {
                      allClass = state.allClass.data!;
                      classList = state.allClass.data!
                          .where((element) =>
                              element.date == datePicked &&
                              element.clastype!.toUpperCase() ==
                                  widget.classType)
                          .toList();
                    }
                    return ClassList(
                      user: widget.user,
                      classList: classList,
                    );
                  }
                  if (state is FilteredClassLoaded) {
                    return ClassList(
                      user: widget.user,
                      classList: state.filteredClasses,
                    );
                  }
                  return ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: ShimmerPlaceholder(
                          height: 80,
                          width: double.infinity,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
