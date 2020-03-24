import 'package:carros/models/carro.dart';
import 'package:carros/pages/favoritos/carro_dao.dart';
import 'package:carros/pages/favoritos/favorito.dart';
import 'package:carros/pages/favoritos/favorito_dao.dart';

class FavoritoService {
  static favoritar(Carro c) async {
    Favorito f = Favorito.fromCarro(c);

    final dao = FavoritoDAO();

    bool exists = await dao.exists(f.id);
    if (exists) {
      dao.delete(f.id);
    } else {
      dao.save(f);
    }
  }

  static Future<List<Carro>> getCarros() async {
    return await CarroDAO()
        .query('select * from carro c, favorito f where c.id = f.id');
  }
}
