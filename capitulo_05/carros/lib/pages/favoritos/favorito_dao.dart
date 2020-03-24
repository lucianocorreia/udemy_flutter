import 'package:carros/pages/favoritos/base_dao.dart';
import 'package:carros/pages/favoritos/favorito.dart';

class FavoritoDAO extends BaseDAO<Favorito> {
  @override
  Favorito fromJson(Map<String, dynamic> map) {
    return Favorito.fromMap(map);
  }

  @override
  String get tableName => 'favorito';
}
