import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../models/class_model.dart';
import '../../models/user_model.dart';
import '../../utils/routes/routes.gr.dart';
import '../class/widgets/class_card.dart';

class SearchBarPage extends StatefulWidget {
  const SearchBarPage({
    Key? key,
    required this.classes,
    required this.user,
  }) : super(key: key);

  final List<Class> classes;
  final UserModel user;

  @override
  State<SearchBarPage> createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage> {
  final searchController = TextEditingController(text: '');
  List<Class> classList = [];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('cancel'),
          )
        ],
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'What do you want to try?',
              prefixIcon: const Icon(Icons.search),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                gapPadding: 0,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            keyboardType: TextInputType.text,
            onSubmitted: (query) {
              classList = widget.classes.where(
                (e) {
                  return e.classname!
                      .toLowerCase()
                      .contains(query.toLowerCase());
                },
              ).toList();
              setState(() {});
            },
          ),
        ),
      ),
      body: searchController.text == ''
          ? const Center(
              child: Text('Search any class'),
            )
          : classList.isNotEmpty
              ? ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: classList.length,
                  itemBuilder: (context, idx) {
                    return CardClass(
                      classType: classList[idx].clastype!.toUpperCase(),
                      isFull: classList[idx].status! != 'Available',
                      title: classList[idx].classname!,
                      trainer: classList[idx].trainer!,
                      startTime: classList[idx].clock!,
                      onTap: () {
                        Navigator.of(context).pop();
                        context.router.push(
                          ClassDetailRoute(
                            user: widget.user,
                            classes: classList[idx],
                            fromSchedule: false,
                          ),
                        );
                      },
                    );
                  },
                )
              : const Center(
                  child: Text('No Class Found'),
                ),
    );
  }
}
