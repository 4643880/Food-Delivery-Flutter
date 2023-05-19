import 'package:flutter/cupertino.dart';

class VerticalSpacer extends StatelessWidget {
  const VerticalSpacer({Key? key, required this.space}) : super(key: key);
  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: space,
    );
  }
}

class HorizontalSpacer extends StatelessWidget {
  const HorizontalSpacer({Key? key, required this.space}) : super(key: key);
  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: space,
    );
  }
}
