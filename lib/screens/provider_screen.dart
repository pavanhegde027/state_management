import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/providers.dart';

class ProviderScreen extends StatefulWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  State<ProviderScreen> createState() => _ProviderScreenState();
}

class _ProviderScreenState extends State<ProviderScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProviderNotifier>(context, listen: false).apiCall();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProviderNotifier>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final model = value.model;
          return ListView.builder(
            itemCount: model.length,
            itemBuilder: (context, index) {
              final models = model[index];
              return  Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                child: Card(
                  color: Colors.black,
                  child: ListTile(
                      title: Text(
                        '${models.firstName}  ${models.lastName}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        '${models.email}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            models.avatar.toString()),
                      )),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
