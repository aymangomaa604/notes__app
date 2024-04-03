import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_search_icon.dart';

class customAppBar extends StatelessWidget {
  const customAppBar({
    super.key,
    required this.Title,
    required this.icon, this.onpressed,
  });
  final String Title;
  final IconData icon;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          Title,
          style: TextStyle(fontSize: 32),
        ),
        Spacer(),
        SearchIcon(
          onpressed: onpressed,
          icon: icon,
        ),
      ],
    );
  }
}
