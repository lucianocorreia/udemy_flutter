import 'dart:convert';

import 'package:carros/utils/prefs.dart';

class Usuario {
  int id;
  String login;
  String nome;
  String email;
  String urlFoto;
  String token;
  List<String> roles;

  Usuario(
      {this.id,
      this.login,
      this.nome,
      this.email,
      this.urlFoto,
      this.token,
      this.roles});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    nome = json['nome'];
    email = json['email'];
    urlFoto = json['urlFoto'];
    token = json['token'];
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['urlFoto'] = this.urlFoto;
    data['token'] = this.token;
    data['roles'] = this.roles;
    return data;
  }

  void save() {
    Map map = toJson();
    String strValue = json.encode(map);
    Prefs.setString('user.prefs', strValue);
  }

  static Future<Usuario> get() async {
    String strValue = await Prefs.getString('user.prefs');
    if (strValue.isEmpty) return null;
    Map map = json.decode(strValue);
    return Usuario.fromJson(map);
  }

  static void clear() {
    Prefs.setString('user.prefs', '');
  }
}
