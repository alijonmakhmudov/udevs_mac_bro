import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:udevs_mac_bro/pages/main/home/category_page/category_childreen_item.dart';

import 'exam_category.dart';




class SubCategoryItem extends StatelessWidget {
  SubCategoryItem({Key? key}) : super(key: key);
  static const String route='/subcategory';
  final ExamCategory children = Get.arguments ?? [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Продукты ${children.name} ',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        elevation: 1,
      ),
      body:ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          StaggeredGrid.count(

            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children:children.children!.map((e) => CategoryChild(allModel: e)).toList(),
          ),
        ],
      ),
    );
  }
}
