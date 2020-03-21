import 'package:carros/models/carro.dart';
import 'package:carros/pages/carro_page.dart';
import 'package:carros/pages/carros_bloc.dart';
import 'package:carros/pages/widgets/text_error.dart';
import 'package:carros/utils/api.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

class CarrosListview extends StatefulWidget {
  final TipoCarro tipo;
  CarrosListview(this.tipo);

  @override
  _CarrosListviewState createState() => _CarrosListviewState();
}

class _CarrosListviewState extends State<CarrosListview>
    with AutomaticKeepAliveClientMixin<CarrosListview> {
  final _bloc = CarrosBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _bloc.loadCarros(widget.tipo);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder(
        stream: _bloc.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return TextError('Não foi possivel buscar os carros.');
          }

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<Carro> carros = snapshot.data;

          return _listview(carros);
        });
  }

  Container _listview(List<Carro> carros) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: carros != null ? carros.length : 0,
        itemBuilder: (context, index) {
          Carro c = carros[index];
          return Card(
            color: Colors.grey[100],
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Image.network(
                      c.urlFoto ??
                          'http://www.livroandroid.com.br/livro/carros/esportivos/Ferrari_FF.png',
                      width: 250,
                    ),
                  ),
                  Text(
                    c.nome,
                    style: TextStyle(fontSize: 22),
                  ),
                  Text(
                    'Descricao...',
                    style: TextStyle(fontSize: 16),
                  ),
                  ButtonBarTheme(
                    data: ButtonBarTheme.of(context),
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('DETALHES'),
                          onPressed: () => _onClickCarro(c),
                        ),
                        FlatButton(
                          child: const Text('SHARE'),
                          onPressed: () {
                            /* ... */
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _onClickCarro(Carro c) {
    push(context, CarroPage(c));
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
