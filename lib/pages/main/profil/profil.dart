import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:udevs_mac_bro/model/user_create/UserMe.dart';
import 'package:udevs_mac_bro/pages/main/profil/profil_logic.dart';


class ProfilPage extends StatelessWidget {
  ProfilPage({Key? key}) : super(key: key);
  final logic = Get.put(ProfilLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        ]
      ),
    );
  }

  Widget userItem(
    UserMe model,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text("firstName : ${model.firstName}"),
          ),
          Container(
            child: Text("lastName : ${model.lastName}"),
          ),
          Container(
            child: Text("phoneNumber : ${model.phoneNumber}"),
          ),
        ],
      ),
    );
  }
}
