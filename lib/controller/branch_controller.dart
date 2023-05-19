import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:food_delivery/repository/branches_service_repo.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/branch_model.dart';

class BranchController extends GetxController implements GetxService {
  RxBool isLoading = false.obs;
  RxString token = "".obs;
  RxList<Datum> branchData = <Datum>[].obs;

  @override
  Future<void> onInit() async {
    await getAllBranches().then((value) {
      if (value) {
        updateIsLoading(false);
      }
    });
    super.onInit();
  }

  Future<bool> getAllBranches() async {
    try {
      updateIsLoading(true);
      dynamic check = await BranchServiceRepo().getBranches();

      if (check != null) {
        if (check['status']['success'] == true &&
            check['status']["code"] == 200) {
          String today = DateFormat('EEEE').format(DateTime.now());

          List<Datum>? branchMod = (check['data']['data'] as List)
              .map((i) => Datum.fromJson(i))
              .toList();

          branchData.value = branchMod;
          // update();
          updateIsLoading(false);
          return true;
        }
      } else {
        log("from else");
      }
      update();
      updateIsLoading(false);
      return false;
    } catch (e) {
      if (kDebugMode) {
        print("Exception in getBranches = $e");
      }
      updateIsLoading(false);
      update();
      return false;
    }
  }

  updateIsLoading(bool newValue) {
    isLoading.value = newValue;
    update();
  }
}
