
// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';




import 'package:get/get.dart';


import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:sizer/sizer.dart';

import 'package:udevs_mac_bro/controller/home_controller.dart';

import 'package:udevs_mac_bro/ui/main/home/banner_page/banner_list.dart';


import 'package:udevs_mac_bro/ui/main/home/category_page/category_list.dart';
import 'package:udevs_mac_bro/ui/main/home/new__product/new_product_list.dart';



class HomePage extends StatelessWidget {

  HomeController controller = Get.put(HomeController());
  var pageIndex = 0.obs;
  TextEditingController _editingController = TextEditingController();
  RxInt _current = 0.obs;
  final CarouselController _controller = CarouselController();
  final List<Widget> itemBanner = allBannerList();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Obx(() {
      return Scaffold(
        // backgroundColor: HexColor('#E5E5E5'),
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                height: 6.h,
                width: 80.w,
                margin: EdgeInsets.only(


                    right: 3.w

                ),
                child: TextField(
                  controller: _editingController,

                  decoration: InputDecoration(
                      filled: true,
                      fillColor: HexColor('#E5E5E5'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.search),
                    hintText: 'Поиск'
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(


                  ),
                  child: Icon(
                    Icons.notifications_none_rounded, color: Colors.grey,size: 4.h,)
              )
            ],
          ),
          toolbarHeight: 8.h,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 2.h,

                  ),
                  child: Column(

                    children: [
                      CarouselSlider(
                        carouselController: _controller,
                        items: itemBanner,
                        options: CarouselOptions(
                          height: 25.h,
                          enlargeCenterPage: true,
                          pageSnapping: true,
                          autoPlay: true,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: const Duration(
                              milliseconds: 300),
                          viewportFraction: 0.9, // onScrolled: (index) {
                            onPageChanged: (index, reason) {
                              _current.value = index;
                            }

                        ),
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: itemBanner
                            .asMap()
                            .entries
                            .map((entry) {
                          return GestureDetector(
                            onTap: () =>
                                _controller.animateToPage(entry.key),
                            child: Container(
                              width:_current.value == entry.key ? 3.w :2.w,
                              height:_current.value == entry.key ? 3.h :2.h,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black)
                                      .withOpacity(
                                      _current.value == entry.key
                                          ? 0.9
                                          : 0.1)),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(

                          left: 5.w
                      ),
                      child: const Text('Новые', style: TextStyle(fontSize: 20),),
                    ),
                    Container(
                      margin: EdgeInsets.only(

                          left: 68.w
                      ),
                      child: const Icon(Icons.arrow_forward),
                    )
                  ],
                ),
                SizedBox(height: 2.h,),
                // Container(
                //
                //   child: SingleChildScrollView(
                //     scrollDirection: Axis.horizontal,
                //     child: Row(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: allNewProductList(),
                //     ),
                //   ),
                // ),
                Container(
                  height: 27.h,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children:allNewProductList() ,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      // top: 2.h,
                      left: 5.w
                  ),
                  child: const Text('Категории', style: TextStyle(fontSize: 20),),
                ),

                StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: allCategoryList(),
                ),

              ],
            ),


          ],

        ),
      );
    });
  }
}

