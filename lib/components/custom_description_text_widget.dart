import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/controller/height_controller.dart';
import 'package:food_delivery/helper/app_colors.dart';
import 'package:get/get.dart';

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({
    super.key,
    required this.text,
  });

  @override
  State<DescriptionTextWidget> createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  late final String firstHalf;
  late final String secondHalf;
  bool flag = true;
  bool textFlag = true;

  @override
  void initState() {
    if (widget.text.length > 140) {
      firstHalf = widget.text.substring(0, 140);
      secondHalf = widget.text.substring(140, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HeightController myController = Get.find();
    return LayoutBuilder(
      builder: (p0, constraints) => Container(
        padding: const EdgeInsets.only(
          top: 20,
          right: 20,
          left: 20,
        ).r,
        child: secondHalf.isEmpty
            ? Column(
                children: [
                  Text(
                    firstHalf,
                    textAlign: TextAlign.end,
                  ),
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textFlag ? (firstHalf + "...") : (firstHalf + secondHalf),
                    textAlign: TextAlign.justify,
                    maxLines: constraints.maxWidth > 640 ? 5 : 8,
                    overflow: TextOverflow.ellipsis,
                  ),
                  InkWell(
                    onTap: () async {
                      // For Text
                      print(textFlag);
                      if (textFlag == true && constraints.maxWidth < 640) {
                        Future.delayed(const Duration(seconds: 1))
                            .whenComplete(() {
                          setState(() {
                            textFlag = false;
                          });
                        });
                      } else if (textFlag == true &&
                          constraints.maxWidth > 640) {
                        Future.delayed(const Duration(seconds: 1))
                            .whenComplete(() {
                          setState(() {
                            textFlag = false;
                          });
                        });
                      } else {
                        setState(() {
                          textFlag = true;
                        });
                      }

                      // For Container Height
                      setState(() {
                        flag = !flag;
                        // print(flag);
                      });
                      if (flag == true) {
                        myController.setHeight(90.h);
                      } else {
                        myController.setHeight(140.h);
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          flag ? "see more" : "see less",
                          style: const TextStyle(color: AppColors.mainColor),
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.mainColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
