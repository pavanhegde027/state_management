
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/app_blocs.dart';
import '../blocs/app_events.dart';
import '../blocs/app_states.dart';
import '../model/user_model.dart';
import '../repo/repositories.dart';

class BlocScreen extends StatelessWidget {
  const BlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(UserRepository()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text('The BloC App')),
        body: blocBody(),
      ),
    );
  }

  Widget blocBody() {
    return BlocProvider(
      create: (context) => UserBloc(
        UserRepository(),
      )..add(LoadUserEvent()),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserLoadedState) {
            User userList = state.users;
            return ListView.builder(
                itemCount: userList.userModel.length,
                itemBuilder: (_, i) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    child: Card(
                        color: Colors.black,
                        child: ListTile(
                            title: Text(
                              '${userList.userModel[i].firstName}  ${userList.userModel[i].lastName}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              '${userList.userModel[i].email}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  userList.userModel[i].avatar.toString()),
                            ))),
                  );
                });
          }
          if (state is UserErrorState) {
            return  Center(
              child: Text("Error ${state.error}"),
            );
          }

          return Container();
        },
      ),
    );
  }
}
