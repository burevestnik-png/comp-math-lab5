import 'package:comp_math_lab5/domain/controllers/drawing_controller.dart';
import 'package:comp_math_lab5/presentation/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OptionTabs extends StatefulWidget {
  final Widget firstChild;
  final Widget secondChild;

  const OptionTabs({
    Key? key,
    required this.firstChild,
    required this.secondChild,
  }) : super(key: key);

  @override
  _OptionTabsState createState() => _OptionTabsState();
}

class _OptionTabsState extends State<OptionTabs> with TickerProviderStateMixin {
  late TabController _tabController;
  final _drawingController = Get.find<DrawingController>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: GetStorage().read("index") ?? 0,
    );

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        GetStorage().write("index", _tabController.index);
        _drawingController.cacheAndCleanChart();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          fieldText("Choose input type:"),
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                child: Text(
                  "Table data",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "Function",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                widget.firstChild,
                widget.secondChild,
              ],
            ),
          )
        ],
      ),
    );
  }
}
