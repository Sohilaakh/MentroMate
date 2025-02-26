import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import 'package:mentroverso/core/utils/themes.dart';
import '../../../../core/utils/app_routes.dart';

class Header extends StatelessWidget {
  String text;
   Header({super.key , required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              GoRouter.of(context).pop(AppRouter.router);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: ColorResources.white,
              size: 18,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: Styles.textStyle20,
          ),
        ],
      ),
    );
  }
}
