import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Luciano Correia'),
              accountEmail: Text('luciano.correia@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/dog4.png'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favoritos'),
              subtitle: Text('Mais informaçøes...'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.airline_seat_legroom_normal),
              title: Text('Favoritos'),
              subtitle: Text('Mais informaçøes...'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favoritos'),
              subtitle: Text('Mais informaçøes...'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favoritos'),
              subtitle: Text('Mais informaçøes...'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
