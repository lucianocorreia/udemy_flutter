import 'package:carros/models/carro.dart';
import 'package:carros/pages/carros_bloc.dart';
import 'package:carros/pages/widgets/carros_listview.dart';
import 'package:carros/pages/widgets/text_error.dart';
import 'package:carros/utils/api.dart';
import 'package:flutter/material.dart';

class CarrosPage extends StatefulWidget {
  final TipoCarro tipo;
  CarrosPage(this.tipo);

  @override
  _CarrosPageState createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage>
    with AutomaticKeepAliveClientMixin<CarrosPage> {
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

          return CarrosListview(carros);
        });
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
