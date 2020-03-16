import 'package:flutter/material.dart';
import 'package:flutter_hello/drawer_list.dart';
import 'package:flutter_hello/pages/hello_listview.dart';
import 'package:flutter_hello/pages/hello_page2.dart';
import 'package:flutter_hello/pages/hello_page3.dart';
import 'package:flutter_hello/utils/nav.dart';
import 'package:flutter_hello/widgets/blue_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hello Flutter'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Tab 1',
              ),
              Tab(
                text: 'Tab 2',
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                _onClickFloat();
              },
            ),
            SizedBox(
              width: 8,
            ),
            FloatingActionButton(
              backgroundColor: Colors.red,
              child: Icon(Icons.favorite),
              onPressed: () {
                _onClickFloat();
              },
            ),
          ],
        ),
        drawer: DrawerList(),
        body: TabBarView(
          children: <Widget>[
            _body(context),
            Container(
              color: Colors.amberAccent,
            )
          ],
        ),
      ),
    );
  }

  _body(context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 16),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _text(),
            _pageView(),
            _buttons(),
          ],
        ),
      ),
    );
  }

  _pageView() {
    return Container(
      height: 300,
      child: PageView(
        children: <Widget>[
          _img('assets/images/dog1.png'),
          _img('assets/images/dog2.png'),
          _img('assets/images/dog3.png'),
          _img('assets/images/dog4.png'),
          _img('assets/images/dog5.png'),
        ],
      ),
    );
  }

  _buttons() {
    return Builder(
      builder: (context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton(
                  'Listview',
                  () => _onClickNavigator(context, HelloListview()),
                ),
                BlueButton(
                  'Page 2',
                  () => _onClickNavigator(context, HelloPage2()),
                ),
                BlueButton(
                  'Page 3',
                  () => _onClickNavigator(context, HelloPage3()),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton('Snack', () => _onClickSnack(context)),
                BlueButton('Dialog', () => _onClickDialog(context)),
                BlueButton('Toast', _onClickToast),
              ],
            ),
          ],
        );
      },
    );
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);

    print('>>> $s');
  }

  _img(String img) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Image.asset(
        img,
        fit: BoxFit.cover,
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

  _onClickSnack(context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Olá Flutter'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      ),
    );
  }

  _onClickDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text('Flutter udemy'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancelar'),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Ok'),
                ),
              ],
            ),
          );
        });
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _onClickFloat() {}
}
