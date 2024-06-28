import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class AuthController extends GetxController implements GetxService {
  AuthController();

  int _loginType = 0;
  int get loginType => _loginType;

  void selectLoginType(int index) {
    _loginType = index;
    print(loginType);
    update();
  }

  static final List<String> _loginTypeList = ['User',"Dealer"];
  List<String> get loginTypeList => _loginTypeList;

}