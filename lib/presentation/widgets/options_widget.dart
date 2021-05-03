import 'package:comp_math_lab5/domain/state/main_screen_state.dart';
import 'package:comp_math_lab5/presentation/widgets/option_logger_widget.dart';
import 'package:comp_math_lab5/presentation/widgets/option_table_data_widget.dart';
import 'package:comp_math_lab5/presentation/widgets/option_tabs_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class Options extends GetView<MainScreenState> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          OptionTabsWidget(
            firstChild: OptionTableData(),
            secondChild: Text("AOAOAOAAOAOAO"),
          ),
          Divider(),
          ElevatedButton(
            child: Text("Compute"),
            onPressed: null,
          ),
          Divider(),
          OptionLogger(),
        ],
      ),
    );
  }
}
