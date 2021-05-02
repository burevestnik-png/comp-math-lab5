import 'package:comp_math_lab5/domain/controllers/drawing_controller.dart';
import 'package:comp_math_lab5/domain/controllers/log_controller.dart';
import 'package:get/get.dart';

class ComputationController extends GetxController {
  final logger = Get.find<LogController>();
  final drawController = Get.find<DrawingController>();
}
