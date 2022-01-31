import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:task_list/const/app_colors.dart';

class AppHeader extends StatelessWidget {
  AppHeader({Key? key}) : super(key: key);
  String now = DateFormat("yyyy-MM-dd").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 44, left: 37),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                now.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.subTitleColor,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Today Tasks",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/profille.png'), fit: BoxFit.cover),
            ),
          )
        ],
      ),
    );
  }
}
