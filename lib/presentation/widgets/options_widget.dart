import 'package:comp_math_lab5/presentation/widgets/function_tab_widget.dart';
import 'package:comp_math_lab5/presentation/widgets/option_logger_widget.dart';
import 'package:comp_math_lab5/presentation/widgets/option_table_data_widget.dart';
import 'package:comp_math_lab5/presentation/widgets/option_tabs_widget.dart';
import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          OptionTabs(
            firstChild: OptionTableData(),
            secondChild: FunctionTab(),
          ),
          Divider(),
          OptionLogger(),
        ],
      ),
    );
  }
}
