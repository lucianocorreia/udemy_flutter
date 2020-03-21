import 'dart:async';

import 'package:carros/models/usuario.dart';
import 'package:carros/pages/simple_bloc.dart';
import 'package:carros/utils/api.dart';
import 'package:carros/utils/api_response.dart';

class LoginBloc extends SimpleBloc<bool> {
  Future<ApiResponse<Usuario>> login(String login, String senha) async {
    add(true);
    ApiResponse response = await Api.login(login, senha);
    add(false);
    return response;
  }
}
