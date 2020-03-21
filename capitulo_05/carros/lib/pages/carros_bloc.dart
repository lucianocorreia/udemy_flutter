import 'dart:async';

import 'package:carros/models/carro.dart';
import 'package:carros/pages/simple_bloc.dart';
import 'package:carros/utils/api.dart';

class CarrosBloc extends SimpleBloc<List<Carro>> {
  loadCarros(TipoCarro tipo) async {
    try {
      List<Carro> carros = await Api.getCarros(tipo);
      add(carros);
    } catch (e) {
      addError(e);
    }
  }
}
