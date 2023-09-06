import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/riverpod_providers.dart';

class RiverpodScreen extends ConsumerStatefulWidget {
  const RiverpodScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RiverpodScreen> createState() => _RiverpodScreenState();
}

class _RiverpodScreenState extends ConsumerState<RiverpodScreen> {
  @override
  Widget build(BuildContext context) {

    final getList = ref.watch(getUserList);

    return Scaffold(

      body: Container(
        child: Column(

          children: [

            SizedBox(height: 20,),

            getList.when(
              data: (data) {

                return Expanded(
                  child: ListView.builder(
                    itemCount: data.userModel.length,
                    itemBuilder: (context, index) {

                      final listData = data.userModel[index];

                      return  Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        child: Card(
                          color: Colors.black,
                          child: ListTile(
                              title: Text(
                                '${listData.firstName}  ${listData.lastName}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                '${listData.email}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    listData.avatar.toString()),
                              )),
                        ),
                      );
                    },
                  ),
                );

              },

              error: (err, s) => Center(
              child: Text(
                'Please Check Your Internet Connection and Try Again',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: Colors.black),
              ),
            ),
              loading: () => Center(
                child: CircularProgressIndicator(),
              ),)
          ],

        ),
      ),

    );
  }
}
