// import 'package:centre_source_m_t/app/modules/home/controllers/home_controller.dart';
// import 'package:centre_source_m_t/widgets/buildList.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// Widget getProductTypeList() {
//     HomeController homeController=Get.put(HomeController());
//     return Expanded(
//       child: FutureBuilder(
//         future: homeController.getPhotos("Dog"),
//         builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: LinearProgressIndicator(),
//             );
//           }
//           return buildList(context, snapshot);
//         },
//       ),
//     );
  // }