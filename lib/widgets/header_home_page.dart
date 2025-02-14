import 'package:flutter/material.dart';
import 'package:tiktok/theme/colors.dart';

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Following",
          style: TextStyle(
            // ignore: deprecated_member_use
            color: white.withOpacity(0.7),
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          "|",
          style: TextStyle(
            // ignore: deprecated_member_use
            color: white.withOpacity(0.3),
            fontSize: 17,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          "For You",
          style: TextStyle(
              color: white, fontSize: 17, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
