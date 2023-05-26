import 'package:flutter/material.dart';

sliderTransformationMethod({
  required int index,
  required currentPageValue,
  required height,
  required scaleFactor,
}) {
  // Object of Matrix4
  Matrix4 matrix = Matrix4.identity();
  // Index is starting from 0 and page value is starting from 0
  // print(1.99999.floor()); // 1
  // print(2.0.floor()); // 2
  // print(2.99999.floor()); // 2
  if (index == currentPageValue.floor()) {
    // For current page
    // zero * anyvalue = zero and remaining will be 1
    // currScale = 1 - (1-1) * (1-0.8)
    // Result = 1
    var currScale = 1 - (currentPageValue - index) * (1 - scaleFactor);
    // 220 * (1 - 1) / 2
    var currTrans = height * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1, currScale.toDouble(), 1)
      ..setTranslationRaw(0, currTrans, 0);
  } else if (index == currentPageValue.floor() + 1) {
    // For next page will count current page value and next index value
    // zero * anyvalue = zero and remaining will be 0.8
    // currScale = 0.8 + [(1-2+1)  * (1-0.8)]
    // Result = 0.8
    var currScale =
        scaleFactor + (currentPageValue - index + 1) * (1 - scaleFactor);
    var currTrans = height * (1 - currScale) / 2;
    // matrix = Matrix4.diagonal3Values(1, currScale, 1);

    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, currTrans, 0);
  } else if (index == currentPageValue.floor() - 1) {
    var currScale = 1 - (currentPageValue - index) * (1 - scaleFactor);
    var currTrans = height * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1, currScale.toDouble(), 1);

    matrix = Matrix4.diagonal3Values(1, currScale.toDouble(), 1)
      ..setTranslationRaw(0, currTrans, 0);
  } else {
    var currScale = 0.8;
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, height * (1 - scaleFactor) / 2, 0);
  }

  return matrix;
}
