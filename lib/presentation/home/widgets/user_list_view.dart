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
  late final TextEditingController searchController;
  late List<User> filteredUsers;

  @override
  void initState() {
    super.initState();
    filteredUsers = widget.users;

    searchController = TextEditingController();
    searchController.addListener(filterUsers);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: searchController,
          key: const Key('search_field'),
          decoration: InputDecoration(
            labelText: 'Search',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: searchController.text.isNotEmpty
                ? ClearSearchIconButton(
                    textController: searchController,
                  )
                : const SizedBox(),
          ),
        ),
        if (filteredUsers.isNotEmpty) ...[
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (_, index) => UserTile(
                user: filteredUsers[index],
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

  void filterUsers() => setState(
        () {
          filteredUsers = widget.users
              .where(
                (user) => user.name
                    .toLowerCase()
                    .contains(searchController.text.toLowerCase()),
              )
              .toList();
        },
      );
}
