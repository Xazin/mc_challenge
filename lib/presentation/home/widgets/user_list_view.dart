import 'package:flutter/material.dart';
import 'package:mc_challenge/domain/user/user.dart';
import 'package:mc_challenge/presentation/home/widgets/user_tile.dart';

class UserListView extends StatefulWidget {
  final List<User> users;
  final TextEditingController searchController;

  const UserListView({
    Key? key,
    required this.users,
    required this.searchController,
  }) : super(key: key);

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  late List<User> filteredUsers;

  @override
  void initState() {
    super.initState();
    filteredUsers = widget.users;
    widget.searchController.addListener(filterUsers);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (filteredUsers.isNotEmpty) ...[
          ...filteredUsers.map(
            (user) => UserTile(
              user: user,
            ),
          ),
        ] else ...[
          const Center(
            child: Text('No users were found, try another search term!'),
          ),
        ],
      ],
    );
  }

  void filterUsers() {
    if (!mounted) return;

    setState(
      () {
        filteredUsers = widget.users
            .where(
              (user) => user.name
                  .toLowerCase()
                  .contains(widget.searchController.text.toLowerCase()),
            )
            .toList();
      },
    );
  }
}
