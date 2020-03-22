import 'package:carros/pages/simple_bloc.dart';
import 'package:carros/utils/api.dart';

class LoripsumBloc extends SimpleBloc<String> {
  static String lorim;
  fetch() async {
    try {
      String s = lorim ?? await Api.getLoripsum();
      lorim = s;
      add(s);
    } catch (e) {
      addError(e);
    }
  }
}
