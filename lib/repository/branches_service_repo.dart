import 'dart:developer';

import 'package:food_delivery/helper/api_helper.dart';

class BranchServiceRepo {
  Future<dynamic> getBranches() async {
    dynamic resultData = await ApiHelper().get(
      apiName: "branches",
      uri: ApiHelper.getApiUrls()[ApiHelper.kBranches]!,
      header: ApiHelper.defaultHeader,
    );
    return resultData;
  }
}
