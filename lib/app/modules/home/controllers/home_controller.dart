// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:centre_source_m_t/models/model_images.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController controller = TextEditingController();

  List<PhotosModel>? dataList = [];
  final count = 0.obs;
  final borderRadius = BorderRadius.circular(12); // Image border
  @override
  void onInit() {
    super.onInit();
  }

  showDialogFunc(ctx, String img) {
    return showDialog(
        context: ctx,
        builder: ((context) => Center(
              child: Material(
                type: MaterialType.transparency,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ClipRect(child: Image.network(img,width:Get.width ,height: Get.height/2,fit: BoxFit.contain,),),
                      // TextButton(onPressed: (() {
                      //   Get.back();
                      // }), child:Text('Back'))

                      Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 208, 197, 196),
                            borderRadius: borderRadius,
                          ),
                          child: ClipRRect(
                            borderRadius: borderRadius,
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(160), // Image radius
                              child: Image.network(img, fit: BoxFit.cover,
                                  //  width:Get.width ,height: Get.height/2,),
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              }),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            )));
  }

  Future fetchData(String query) async {
    try {
      if (query.isNotEmpty) {
        dataList = [];
        var apiKey = '29743685-84b7eeb4936e4f1716329fd5a';
        String url =
            'https://pixabay.com/api/?key=$apiKey&q=$query&image_type=photo';
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          var data = json.decode(response.body);
          var items = data['hits'];

          for (var element in items) {
            dataList?.add(PhotosModel.fromJson(element));
          }
        }
      } else {
        dataList = [];
      }
      update();
    } on Exception catch (e) {
      return GetSnackBar(
        title: 'No images',
      );
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
