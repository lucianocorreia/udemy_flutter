import 'dart:async';

import 'package:carros/models/carro.dart';
import 'package:carros/pages/favoritos/carro_dao.dart';
import 'package:carros/pages/simple_bloc.dart';
import 'package:carros/utils/api.dart';
import 'package:carros/utils/network.dart';

class CarrosBloc extends SimpleBloc<List<Carro>> {
  Future<List<Carro>> loadCarros(TipoCarro tipo) async {
    try {
      bool networkOn = await isNetworkOn();
      if (!networkOn) {
        List<Carro> carros = await CarroDAO()
            .findAllByTipo(tipo.toString().replaceAll('TipoCarro.', ''));
        add(carros);
        return carros;
      }

      List<Carro> carros = await Api.getCarros(tipo);
      add(carros);

      return carros;
    } catch (e) {
      addError(e);
      return null;
    }
  }
}
