import 'package:comp_math_lab5/presentation/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
