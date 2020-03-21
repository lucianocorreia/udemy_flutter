import 'dart:async';

import 'package:carros/models/usuario.dart';
import 'package:carros/pages/home_page.dart';
import 'package:carros/pages/login_bloc.dart';
import 'package:carros/utils/alert.dart';
import 'package:carros/utils/api.dart';
import 'package:carros/utils/api_response.dart';
import 'package:carros/utils/nav.dart';
import 'package:carros/widgets/app_button.dart';
import 'package:carros/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginController = TextEditingController();
  final _senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _focusSenha = FocusNode();
  final _bloc = LoginBloc();

  @override
  void initState() {
    super.initState();

    Usuario.get().then((user) {
      if (user != null) {
        push(context, HomePage(), replace: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carros'),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            AppText(
              'Login',
              'Informe o login',
              controller: _loginController,
              validator: _validateLogin,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              nextFocus: _focusSenha,
            ),
            SizedBox(
              height: 20,
            ),
            AppText(
              'Senha',
              'Informe a senha',
              password: true,
              controller: _senhaController,
              validator: _validateSenha,
              keyboardType: TextInputType.number,
              focusNode: _focusSenha,
            ),
            SizedBox(
              height: 20,
            ),
            StreamBuilder<bool>(
                stream: _bloc.stream,
                initialData: false,
                builder: (context, snapshot) {
                  return AppButton(
                    'Entrar',
                    onPressed: _onClickLogin,
                    showProgress: snapshot.data ?? false,
                  );
                }),
          ],
        ),
      ),
    );
  }

  _onClickLogin() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    String login = _loginController.text;
    String senha = _senhaController.text;

    ApiResponse response = await _bloc.login(login, senha);
    if (response.ok) {
      push(context, HomePage(), replace: true);
    } else
      alert(context, response.msg);
  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return 'Digite o login';
    } else
      return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return 'Digite a senha';
    } else
      return null;
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
