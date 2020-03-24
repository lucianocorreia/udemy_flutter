import 'package:carros/models/usuario.dart';
import 'package:carros/pages/favoritos/db_helper.dart';
import 'package:carros/pages/home_page.dart';
import 'package:carros/pages/login_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration(seconds: 5), () {
    //   push(context, LoginPage());
    // });

    // Inicializar o banco de dados
    Future futureA = DatabaseHelper.getInstance().db;
    Future futureB = Future.delayed(Duration(seconds: 3));
    Future futureC = Usuario.get();

    Future.wait([futureA, futureB, futureC]).then((values) {
      Usuario user = values[2];

      if (user != null) {
        push(context, HomePage(), replace: true);
      } else {
        push(context, LoginPage(), replace: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[200],
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
