import 'package:comp_math_lab5/presentation/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionTabsWidget extends StatefulWidget {
  final Widget firstChild;
  final Widget secondChild;

  const OptionTabsWidget({
    Key? key,
    required this.firstChild,
    required this.secondChild,
  }) : super(key: key);

  @override
  _OptionTabsWidgetState createState() => _OptionTabsWidgetState();
}

class _OptionTabsWidgetState extends State<OptionTabsWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          fieldText("Choose input type:"),
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                // icon: Icon(Icons.cloud_outlined),
                child: Text("Function", style: TextStyle(color: Colors.black)),
              ),
              Tab(
                // icon: Icon(Icons.beach_access_sharp),
                child:
                    Text("Table data", style: TextStyle(color: Colors.black)),
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