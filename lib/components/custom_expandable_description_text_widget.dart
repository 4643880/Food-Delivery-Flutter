import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/helper/app_colors.dart';
import 'package:get/get.dart';

class ExpandableDescriptionTextWidget extends StatefulWidget {
  final String text;

  ExpandableDescriptionTextWidget({
    super.key,
    required this.text,
  });

  @override
  State<ExpandableDescriptionTextWidget> createState() =>
      _ExpandableDescriptionTextWidgetState();
}

class _ExpandableDescriptionTextWidgetState
    extends State<ExpandableDescriptionTextWidget> {
  late final String firstHalf;
  late final String secondHalf;
  bool flag = true;
  // bool textFlag = true;

  // double textHeight = 1.sh / 5.23.h;

  @override
  void initState() {
    // print(textHeight.toString() + "abc");
    if (widget.text.length > 350) {
      firstHalf = widget.text.substring(0, 350);
      secondHalf = widget.text.substring(350, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, constraints) => secondHalf.isEmpty
          ? Text(
              firstHalf,
              textAlign: TextAlign.end,
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  flag ? (firstHalf + "...") : (firstHalf + secondHalf),
                  textAlign: TextAlign.justify,
                  style:
                      const TextStyle(color: AppColors.textColor, height: 1.7),
                  // maxLines: constraints.maxWidth > 640 ? 12 : 18,
                  // overflow: TextOverflow.ellipsis,
                ),
                InkWell(
                  onTap: () async {
                    setState(() {
                      flag = !flag;
                      // print(flag);
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        flag ? "see more" : "see less",
                        style: const TextStyle(color: AppColors.mainColor),
                      ),
                      Icon(
                        flag ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
