import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:instightful_interviews_app/core/components/exports.dart';
import 'package:instightful_interviews_app/features/auth/presentation/controllers/IndexController.dart';

class SliderWidget extends StatelessWidget {
  final PageIndexController pageIndexController =
      Get.put(PageIndexController());
  SliderWidget({super.key});

  final Map<int, Map<String, String>> imageList = {
    0: {
      "title": "Worried About your first Interview",
      "path": "assets/icons/slider1.svg"
    },
    1: {"title": "Make AI Your Buddy", "path": "assets/icons/slider2.svg"},
    2: {
      "title": "Excel your next interview and be prepared advance",
      "path": "assets/icons/slider3.svg"
    }
  };

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: width,
            height: width * 0.8,
            child: PageView.builder(
              onPageChanged: (value) {
                currentIndex = value;
                pageIndexController.setPageIndex(value);
              },
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                Map<String, String> data =
                    imageList[index] as Map<String, String>;

                return Column(
                  children: [
                    Container(
                      width: width * 0.8,
                      child: MyTexts.h2(data['title']!, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SvgPicture.asset(
                      data['path']!,
                      width: width,
                      fit: BoxFit.fill,
                      height: width * 0.6,
                    )
                  ],
                );
              },
            ),
          ),
          // Obx(() => Text(
          //       'Active Index: ${pageIndexController.pageIndex.value}',
          //       style: TextStyle(fontSize: 20),
          //     )),
          Obx(() => Container(
                width: width * 0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: pageIndexController.pageIndex.value ==
                                  currentIndex
                              ? AppColors.KdarkGray
                              : AppColors.Kgray,
                          shape: BoxShape.circle,
                        )),
                    Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: pageIndexController.pageIndex.value ==
                                  currentIndex
                              ? AppColors.KdarkGray
                              : AppColors.Kgray,
                          shape: BoxShape.circle,
                        )),
                    Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: pageIndexController.pageIndex.value ==
                                  currentIndex
                              ? AppColors.KdarkGray
                              : AppColors.Kgray,
                          shape: BoxShape.circle,
                        )),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
