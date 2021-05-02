import 'package:comp_math_lab5/domain/controllers/computation_controller.dart';
import 'package:comp_math_lab5/domain/controllers/drawing_controller.dart';
import 'package:comp_math_lab5/domain/controllers/log_controller.dart';
import 'package:comp_math_lab5/domain/state/main_screen_state.dart';
import 'package:get/get.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<LogController>(LogController());
    Get.put<DrawingController>(DrawingController());
    Get.put<ComputationController>(ComputationController());
    Get.put<MainScreenState>(MainScreenState());
  }
}
