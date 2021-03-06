import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'package:udevs_mac_bro/model/category_model/category_child_item.dart';
import 'package:udevs_mac_bro/pages/main/home/category_child_allitem/category_child_allitem_view.dart';
import 'package:udevs_mac_bro/pages/main/home/category_child_item/category_child_item.dart';




import 'category_child_item_logic.dart';

class Category_child_itemPage extends StatelessWidget {
  // final logic = Get.find<Category_child_itemLogic>();
  final logic = Get.put(Category_child_itemLogic());
  final String children = Get.arguments ?? '';
  static const String route='/categorychild';
  @override
  Widget build(BuildContext context) {
    final RxList<Products> product = logic.category;
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Продукты ${children} ',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 1,
        ),
        body: logic.loading.value
            ? Center(child: CircularProgressIndicator())
            : ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(top: 2),
                height: 50,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.white),
                child: Row(
                  children: [
                    SizedBox(
                      width: 3,
                    ),
                    Icon(
                      Icons.menu_outlined,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text('Все продукты'),
                    SizedBox(
                      width: 50,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              onTap: () {
                // Get.to(()=>Category_child_allitemPage(),);
                Get.toNamed(Category_child_allitemPage.route,
                    arguments: children);
              },
            ),
            StaggeredGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: product
                  .map((e) => CategoryChildItemm(allModel: e))
                  .toList(),
            ),
          ],
        ),
      );
    });
  }
}
