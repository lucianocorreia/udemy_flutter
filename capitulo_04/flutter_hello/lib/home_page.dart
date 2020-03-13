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
        child: _button(),
      ),
    );
  }

  _button() {
    return RaisedButton(
      color: Colors.blue,
      onPressed: () => this._onClickOk(),
      child: Text(
        'Ok',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  void _onClickOk() {
    print('On Click Ok');
  }

  _img() {
    return Image.asset('assets/images/dog2.png');
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
