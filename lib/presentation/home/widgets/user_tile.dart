import 'package:flutter/material.dart';
import 'package:mc_challenge/domain/user/user.dart';
import 'package:mc_challenge/presentation/user/user_details_screen.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.company.name),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserDetailsScreen(user: user),
        ),
      ),
    );
  }
}
