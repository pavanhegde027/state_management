import 'package:api_practice/model/user_model.dart';
import 'package:flutter/cupertino.dart';

import '../repo/repositories.dart';

class ProviderNotifier extends ChangeNotifier {

  final service = UserRepository();
  bool isLoading = false;

  List<UserModel> _model = [];
  List<UserModel> get model => _model;

  Future apiCall() async {

    if(!isLoading) {

      isLoading = true;
      notifyListeners();

      await service.getUsers().then((value) {

        if(value.userModel.isNotEmpty) {

          _model = value.userModel;
          // _model.addAll(value.userModel);
        }

      });

      isLoading = false;
      notifyListeners();
    }




  }

}