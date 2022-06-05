import 'package:flutter/material.dart';

/// [SearchableAppBar] return a SliverAppBar with a search
/// action, that when enabled will show a [TextField],
/// the value of the TextField will be sent back through a
/// callback function.
class SearchableAppBar extends StatefulWidget {
  final TextEditingController searchController;

  const SearchableAppBar({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  @override
  State<SearchableAppBar> createState() => _SearchableAppBarState();
}

class _SearchableAppBarState extends State<SearchableAppBar> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: isSearching
          ? TextField(
              controller: widget.searchController,
              decoration: const InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
              ),
            )
          : const Text('Browse Users'),
      leading: isSearching
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: toggleSearch,
            )
          : null,
      floating: true,
      snap: true,
      actions: [
        isSearching
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: clearSearch,
              )
            : IconButton(
                icon: const Icon(Icons.search),
                onPressed: toggleSearch,
              ),
      ],
    );
  }

  void clearSearch() {
    widget.searchController.clear();
  }

  void toggleSearch() {
    setState(() {
      if (isSearching) {
        clearSearch();
      }

      isSearching = !isSearching;
    });
  }
}
