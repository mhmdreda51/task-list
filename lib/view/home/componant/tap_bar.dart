import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:task_list/const/app_colors.dart';

class AppTabBar extends StatelessWidget {
  final TabController tabController;

  const AppTabBar({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 160,
        left: 25,
      ),
      child: TabBar(
        controller: tabController,
        labelColor: AppColors.titleColor,
        unselectedLabelColor: AppColors.subTitleColor,
        isScrollable: true,
        indicator: DotIndicator(
          color: Colors.black,
          distanceFromCenter: 16,
          radius: 3,
          paintingStyle: PaintingStyle.fill,
        ),
        tabs: const [
          Tab(
            text: "All",
          ),
          Tab(
            text: "Completed",
          ),
          Tab(
            text: "Uncompleted",
          ),
        ],
      ),
    );
  }
}
