import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarImpl extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final double? fontSize;
  final bool? activeGoBack;

  const AppBarImpl(
      {super.key,
      required this.title,
      this.actions,
      this.fontSize = 22,
      this.activeGoBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: activeGoBack ?? false,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: fontSize, fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: actions ?? [])
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
