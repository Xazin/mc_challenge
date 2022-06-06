import 'package:flutter/material.dart';
import 'package:mc_challenge/presentation/home/widgets/app_bar_icon_button.dart';
import 'package:mc_challenge/presentation/theme/constants.dart';

/// [SearchableAppBar] return a SliverAppBar with a search
/// action, that when toggled will show a [TextField].
///
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
              style: const TextStyle(
                fontSize: 20.0,
                color: white,
              ),
              cursorColor: white,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
                hintText: 'Search',
                border: InputBorder.none,
                hintStyle: TextStyle(color: white.withAlpha(155)),
              ),
            )
          : const Text('Browse users'),
      leading: isSearching
          ? AppBarIconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: toggleSearch,
            )
          : null,
      floating: true,
      snap: true,
      actions: [
        isSearching
            ? AppBarIconButton(
                icon: const Icon(Icons.clear),
                onPressed: clearSearch,
              )
            : AppBarIconButton(
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
