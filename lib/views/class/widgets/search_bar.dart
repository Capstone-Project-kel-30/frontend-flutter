import 'package:flutter/material.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key, required this.onPressed}) : super(key: key);

  final Function(String) onPressed;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 2,
        shadowColor: kLightColor,
        child: TextFormField(
          controller: searchController,
          style: AppTheme.theme(context).textTheme.bodySmall,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10),
            hintText: 'Search',
            hintStyle: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                  color: kPrimaryColor,
                  fontWeight: kMediumWeight,
                ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              splashRadius: 18,
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.search),
              onPressed: () {
                FocusScope.of(context).unfocus();
                widget.onPressed(searchController.text);
              },
            ),
          ),
        ),
      ),
    );
  }
}
