import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final String url;
  const IconContainer({Key? Key, required this.url})
      : assert(url != null),
        super(key: Key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 200,
      child: CircleAvatar(
        radius: 100.0,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(this.url),
      ),
    );
  }
}
