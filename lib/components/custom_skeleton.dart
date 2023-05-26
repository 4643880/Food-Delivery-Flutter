import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key, this.height, this.width}) : super(key: key);

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
    );
  }
}

class NewsCardSkelton extends StatelessWidget {
  const NewsCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      // baseColor: Colors.grey.shade900,
      // highlightColor: Colors.grey.shade400,
      baseColor: Colors.grey.shade900,
      highlightColor: Colors.grey.shade300,
      child: const Row(
        children: [
          Skeleton(height: 120, width: 120),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Skeleton(width: 80),
                SizedBox(height: 8),
                Skeleton(),
                SizedBox(height: 8),
                Skeleton(),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Skeleton(),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Skeleton(),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}



// Container(
//                       margin:
//                           const EdgeInsets.symmetric(vertical: 6, horizontal: 0)
//                               .r,
//                       decoration: BoxDecoration(
//                         borderRadius:
//                             BorderRadius.all(const Radius.circular(20).r),
//                         color: Colors.white,
//                         boxShadow: const [
//                           BoxShadow(
//                             blurRadius: 5,
//                             color: Colors.grey,
//                             offset: Offset(0, 5),
//                           ),
//                         ],
//                       ),
//                       child: InkWell(
//                         onTap: () {
//                           myController.initProduct(product: eachProduct);
//                           Get.toNamed(
//                             RouteHelper.routeRecommendedFoodDetails,
//                             arguments: eachProduct,
//                           );
//                         },
//                         child: Row(
//                           children: [
//                             Container(
//                               // padding: EdgeInsets.only(top: 10.r, bottom: 5.r),
//                               width: 100.w,
//                               height: 100.h,
//                               decoration: BoxDecoration(
//                                 color:
//                                     index.isEven ? Colors.orange : Colors.blue,
//                                 borderRadius: BorderRadius.circular(20),
//                                 image: DecorationImage(
//                                     fit: BoxFit.cover,
//                                     image: NetworkImage(
//                                         "${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}${eachProduct.img!}")),
//                               ),
//                             ),
//                             Expanded(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(0.0).r,
//                                 child: Container(
//                                   width: 80.w,
//                                   height: 80.h,
//                                   // padding: EdgeInsets,
//                                   // color: Colors.red,
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         BigText(
//                                           text: eachProduct.name!,
//                                           size: 16.sp,
//                                         ),
//                                         BigText(
//                                           text: eachProduct.description!,
//                                           size: 10.sp,
//                                           color: Colors.black26,
//                                         ),
//                                         const Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             IconAndTextWidget(
//                                               iconData: Icons.circle_sharp,
//                                               iconColor: AppColors.iconColor1,
//                                               text: "Normal",
//                                             ),
//                                             IconAndTextWidget(
//                                               iconData: Icons.location_on,
//                                               iconColor: AppColors.mainColor,
//                                               text: "1.7 Km",
//                                             ),
//                                             IconAndTextWidget(
//                                               iconData:
//                                                   Icons.access_time_rounded,
//                                               iconColor: AppColors.iconColor2,
//                                               text: "32 min",
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),