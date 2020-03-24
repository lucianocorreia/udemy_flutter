import 'package:carros/models/carro.dart';
import 'package:carros/pages/favoritos/base_dao.dart';

// Data Access Object
class CarroDAO extends BaseDAO<Carro> {
  Future<List<Carro>> findAllByTipo(String tipo) async {
    final dbClient = await db;

    final list = await dbClient
        .rawQuery('select * from $tableName where tipo =? ', [tipo]);

    return list.map<Carro>((json) => fromJson(json)).toList();
  }

  @override
  String get tableName => 'carro';

  @override
  Carro fromJson(Map<String, dynamic> map) {
    return Carro.fromMap(map);
  }
}
