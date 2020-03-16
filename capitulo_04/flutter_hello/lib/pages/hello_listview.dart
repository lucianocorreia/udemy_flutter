import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/dog_page.dart';
import 'package:flutter_hello/utils/nav.dart';

class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class HelloListview extends StatefulWidget {
  @override
  _HelloListviewState createState() => _HelloListviewState();
}

class _HelloListviewState extends State<HelloListview> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listview'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              setState(() {
                _gridView = false;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () {
              setState(() {
                _gridView = true;
              });
            },
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    final List<Dog> dogs = [
      Dog('Jack Russel', 'assets/images/dog1.png'),
      Dog('Labrador', 'assets/images/dog2.png'),
      Dog('Pug', 'assets/images/dog3.png'),
      Dog('Rotweiller', 'assets/images/dog4.png'),
      Dog('Pastor', 'assets/images/dog5.png'),
    ];

    if (_gridView) {
      return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        },
      );
    } else {
      return ListView.builder(
        itemExtent: 350,
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        },
      );
    }
  }

  _itemView(List<Dog> dogs, int index) {
    Dog dog = dogs[index];
    return GestureDetector(
      onTap: () {
        push(context, DogPage(dog));
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _img(dog.foto),
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                dog.nome,
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _img(String img) {
    return Container(
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    );
  }
}
