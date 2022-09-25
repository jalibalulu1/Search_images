import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:lottie/lottie.dart';

class HomeView extends GetView<HomeController> {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(66, 105, 99, 99),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: homeController.controller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    hintText: 'Search for images',
                    hintStyle: TextStyle(color: Colors.white70),
                    prefixIcon: Icon(Icons.search, color: Colors.white70),
                    suffixIcon: IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 22,
                        ),
                        onPressed: (() {
                          homeController
                              .fetchData(homeController.controller.text);
                        })),
                    border: OutlineInputBorder(),
                  ),
                )),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GetBuilder<HomeController>(
                  builder: (context) {
                    return homeController.dataList!.isNotEmpty
                        ? GridView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15),
                            itemCount: homeController.dataList!.length,
                            itemBuilder: (BuildContext context, int index) {
                              String img =
                                  homeController.dataList![index].webformatURL;
                              return GestureDetector(
                                onTap: () => homeController.showDialogFunc(
                                    context,
                                    homeController
                                        .dataList![index].largeImageURL),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(20), // Image border
                                  child: SizedBox.fromSize(
                                    size: Size.fromRadius(48), // Image radius
                                    child:
                                        Image.network(img, fit: BoxFit.cover),
                                  ),
                                ),
                              );
                            },
                          )
                        : Container(
                            width: Get.width / 1.3,
                            child: Lottie.asset(
                                'asset/images/96262-detective-search.json'),
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
