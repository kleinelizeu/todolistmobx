import 'package:mobx/mobx.dart';

import 'client.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  var client = Client();

  @computed
  bool get isValid {
    return validateName() == null && validateEmail() == null;
  }

  String validateName() {
    if (client.name == null || client.name.isEmpty) {
      return "Campo Obrigatório";
    }
    //  return null;
  }

  String validateEmail() {
    if (client.email == null ||
        client.email.isEmpty ||
        !client.email.contains("@")) {
      return "Email inválido";
    }
    return null;
  }
}
