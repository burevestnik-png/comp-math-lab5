import 'package:get/get.dart';

enum ScreenState { IDLE, WAITING }

class IState extends GetxController {
  var _status = ScreenState.IDLE;

  ScreenState get state => _status;

  void setState(ScreenState state) {
    _status = state;
    update();
  }
}
