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
            _text(
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
            _text(
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
            _button('Entrar', _onClickLogin),
          ],
        ),
      ),
    );
  }

  Container _button(String text, Function onPressed) {
    return Container(
      height: 46,
      child: RaisedButton(
        onPressed: onPressed,
        color: Colors.blue,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
    );
  }

  TextFormField _text(
    String label,
    String hint, {
    bool password = false,
    TextEditingController controller,
    FormFieldValidator<String> validator,
    TextInputType keyboardType,
    TextInputAction textInputAction,
    FocusNode focusNode,
    FocusNode nextFocus,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) FocusScope.of(context).requestFocus(nextFocus);
      },
    );
  }

  _onClickLogin() {
    bool formOk = _formKey.currentState.validate();
    if (!formOk) {
      return;
    }

    String login = _loginController.text;
    String senha = _senhaController.text;

    print('login: $login, senha: $senha');
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
}
