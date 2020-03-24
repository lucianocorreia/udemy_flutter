import 'package:carros/models/carro.dart';
import 'package:carros/pages/carros_bloc.dart';
import 'package:carros/pages/favoritos/favoritos_bloc.dart';
import 'package:carros/pages/widgets/carros_listview.dart';
import 'package:carros/pages/widgets/text_error.dart';
import 'package:carros/utils/api.dart';
import 'package:flutter/material.dart';

class FavoritosPage extends StatefulWidget {
  @override
  _FavoritosPageState createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage>
    with AutomaticKeepAliveClientMixin<FavoritosPage> {
  final _bloc = FavoritosBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _bloc.loadCarros();
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

          return RefreshIndicator(
            onRefresh: _onRefresh,
            child: CarrosListview(carros),
          );
        });
  }

  Future<void> _onRefresh() {
    return _bloc.loadCarros();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
