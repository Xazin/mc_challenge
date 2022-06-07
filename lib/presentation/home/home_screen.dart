import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:mc_challenge/common/types/either.dart';
import 'package:mc_challenge/domain/user/user.dart';
import 'package:mc_challenge/domain/user/user_failure.dart';
import 'package:mc_challenge/infrastructure/user_repository.dart';
import 'package:mc_challenge/presentation/home/widgets/searchable_app_bar.dart';
import 'package:mc_challenge/presentation/home/widgets/user_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final UserRepository userRepository;
  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    // TODO: would not expose this to Presentation layer normally (rather in a BLOC)
    userRepository = UserRepository(http.Client());
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SearchableAppBar(
            searchController: searchController,
          ),
          SliverToBoxAdapter(
            child: FutureBuilder(
              future: userRepository.getUsers(),
              builder: (context,
                  AsyncSnapshot<Either<UserFailure, List<User>>> snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const LinearProgressIndicator();
                }

                if (!snapshot.hasData) {
                  return const Center(
                    child: Text('We did not find any users, try again later!'),
                  );
                }

                return snapshot.data!.fold(
                  (failure) => Center(child: Text(failure.message)),
                  (users) => UserListView(
                    users: users,
                    searchController: searchController,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
