import 'package:comp_math_lab5/domain/controllers/computation_controller.dart';
import 'package:comp_math_lab5/domain/controllers/drawing_controller.dart';
import 'package:comp_math_lab5/domain/controllers/function_tab_controller.dart';
import 'package:comp_math_lab5/domain/controllers/log_controller.dart';
import 'package:comp_math_lab5/domain/controllers/table_data_controller.dart';
import 'package:comp_math_lab5/domain/controllers/x_picker_controller.dart';
import 'package:get/get.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<LogController>(LogController());
    Get.put<DrawingController>(DrawingController());
    Get.put<ComputationController>(ComputationController(), tag: "table");
    Get.put<ComputationController>(ComputationController(), tag: "function");
    Get.put<XPickerController>(XPickerController());
    Get.put<FunctionTabController>(FunctionTabController());
    Get.put<TableDataController>(TableDataController());
  }
}
