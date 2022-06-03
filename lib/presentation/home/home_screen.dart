import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:mc_challenge/common/types/either.dart';
import 'package:mc_challenge/domain/user/user.dart';
import 'package:mc_challenge/infrastructure/user_repository.dart';
import 'package:mc_challenge/presentation/home/widgets/user_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final UserRepository _userRepository;

  @override
  void initState() {
    super.initState();
    // TODO: would not expose this to Presentation layer normally (rather in a BLOC)
    _userRepository = UserRepository(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Browse Users'),
      ),
      body: FutureBuilder(
        future: _userRepository.getUsers(),
        builder: (context, AsyncSnapshot<Either<String, List<User>>> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Text('We did not find any users!, try again later!'),
            );
          }

          return snapshot.data!.fold(
            (error) => Center(child: Text(error)),
            (users) => UserListView(users: users),
          );
        },
      ),
    );
  }
}
