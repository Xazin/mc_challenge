import 'package:flutter/material.dart';
import 'package:mc_challenge/domain/user/user.dart';
import 'package:mc_challenge/presentation/user/widgets/info_box.dart';
import 'package:mc_challenge/presentation/user/widgets/user_avatar.dart';

class UserDetailsScreen extends StatelessWidget {
  final User user;
  const UserDetailsScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          user.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        UserAvatar(name: user.name),
                        const SizedBox(height: 10),
                        Text(
                          user.name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          user.company.name,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                InfoBox(
                  title: 'Personal Information',
                  infos: user.toInfo(),
                ),
                const SizedBox(height: 15),
                InfoBox(
                  title: 'Address Information',
                  infos: user.address.toInfo(),
                ),
                const SizedBox(height: 15),
                InfoBox(
                  title: 'Professional Information',
                  infos: user.company.toInfo(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
