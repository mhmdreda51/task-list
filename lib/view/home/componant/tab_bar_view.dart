import 'package:flutter/material.dart';
import 'package:task_list/view/home/componant/All.dart';
import 'package:task_list/view/home/componant/Completed.dart';
import 'package:task_list/view/home/componant/Uncompleted.dart';

class TapBarVieww extends StatelessWidget {
  const TapBarVieww({
    required this.tabController,
  });
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 40, top: 250),
        width: double.maxFinite,
        child: TabBarView(
          controller: tabController,
          children: [
            All(),
            Completed(),
            Uncompleted(),
          ],
        ));
  }
}
