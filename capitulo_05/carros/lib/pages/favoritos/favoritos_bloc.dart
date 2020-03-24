import 'dart:async';

import 'package:carros/models/carro.dart';
import 'package:carros/pages/favoritos/favorito_service.dart';
import 'package:carros/pages/simple_bloc.dart';

class FavoritosBloc extends SimpleBloc<List<Carro>> {
  Future<List<Carro>> loadCarros() async {
    try {
      List<Carro> carros = await FavoritoService.getCarros();
      add(carros);

      return carros;
    } catch (e) {
      addError(e);
      return null;
    }
  }
}
