import 'package:flutter/material.dart';
import 'package:mc_challenge/domain/user/user.dart';
import 'package:mc_challenge/presentation/home/widgets/clear_search_icon_button.dart';
import 'package:mc_challenge/presentation/home/widgets/user_tile.dart';

class UserListView extends StatefulWidget {
  final List<User> users;

  const UserListView({Key? key, required this.users}) : super(key: key);

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  late final TextEditingController _searchController;
  late List<User> _filteredUsers;

  @override
  void initState() {
    super.initState();
    _filteredUsers = widget.users;

    _searchController = TextEditingController();
    _searchController.addListener(_filterUsers);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _searchController,
          key: const Key('search_field'),
          decoration: InputDecoration(
            labelText: 'Search',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: _searchController.text.isNotEmpty
                ? ClearSearchIconButton(
                    textController: _searchController,
                  )
                : const SizedBox(),
          ),
        ),
        if (_filteredUsers.isNotEmpty) ...[
          Expanded(
            child: ListView.builder(
              itemCount: _filteredUsers.length,
              itemBuilder: (_, index) => UserTile(
                user: _filteredUsers[index],
              ),
            ),
          ),
        ] else ...[
          const Expanded(
            child: Center(
              child: Text('No users were found, try another search term!'),
            ),
          ),
        ],
      ],
    );
  }

  void _filterUsers() => setState(
        () {
          _filteredUsers = widget.users
              .where(
                (user) => user.name
                    .toLowerCase()
                    .contains(_searchController.text.toLowerCase()),
              )
              .toList();
        },
      );
}
