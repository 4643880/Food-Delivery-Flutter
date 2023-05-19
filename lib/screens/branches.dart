import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/components/common_branch_widget.dart';
import 'package:food_delivery/components/common_spacer.dart';
import 'package:food_delivery/controller/branch_controller.dart';
import 'package:food_delivery/helper/app_colors.dart';
import 'package:get/get.dart';

class BranchesScreen extends StatelessWidget {
  const BranchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BranchController>(builder: (branchController) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Branches Page"),
        ),
        body: SafeArea(
          child: branchController.isLoading.isTrue
              ? CircularProgressIndicator()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      VerticalSpacer(space: 12.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: branchController.branchData.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CommonBranchWidget(
                              city:
                                  branchController.branchData[index].name ?? "",
                              address:
                                  branchController.branchData[index].address ??
                                      "",
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
        ),
      );
    });
  }
}
