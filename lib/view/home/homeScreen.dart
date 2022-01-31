import 'package:flutter/material.dart';
import 'package:task_list/const/app_colors.dart';
import 'package:task_list/view/home/componant/header.dart';
import 'package:task_list/view/home/componant/tap_bar.dart';

import 'componant/tab_bar_view.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor.withOpacity(1),
        body: Stack(
          children: [
            AppHeader(),
            AppTabBar(
              tabController: _tabController,
            ),
            TapBarVieww(
              tabController: _tabController,
            ),
          ],
        ),
      ),
    );
  }
}
