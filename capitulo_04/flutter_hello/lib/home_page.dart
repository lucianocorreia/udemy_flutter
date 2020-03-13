import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello Flutter'),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      color: Colors.white,
      child: Center(
        child: _text(),
      ),
    );
  }

  _text() {
    return Text(
      'Hello World',
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.solid,
      ),
    );
  }
}
