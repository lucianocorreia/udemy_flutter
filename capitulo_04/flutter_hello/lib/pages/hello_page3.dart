import 'package:flutter/material.dart';
import 'package:flutter_hello/widgets/blue_button.dart';

class HelloPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 3'),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Center(
      child: BlueButton(
        'Voltar',
        () => _onClickVoltar(context),
      ),
    );
  }

  _onClickVoltar(context) {
    Navigator.pop(context, 'Page 3');
  }
}
