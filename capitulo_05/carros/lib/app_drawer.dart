import 'package:carros/models/usuario.dart';
import 'package:carros/pages/login_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            FutureBuilder<Usuario>(
              future: Usuario.get(),
              builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
                Usuario user = snapshot.data;
                return user != null ? _userHeader(user) : Container();
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () => _onClickLogout(context),
            ),
          ],
        ),
      ),
    );
  }

  UserAccountsDrawerHeader _userHeader(user) {
    return UserAccountsDrawerHeader(
      accountName: Text(user.nome),
      accountEmail: Text(user.email),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(user.urlFoto),
      ),
    );
  }

  _onClickLogout(context) {
    Usuario.clear();
    Navigator.pop(context);
    push(context, LoginPage(), replace: true);
  }
}
