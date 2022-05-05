import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
class OtpLoginPage extends StatefulWidget {
  const OtpLoginPage({Key? key}) : super(key: key);

  @override
  State<OtpLoginPage> createState() => _OtpLoginPageState();
}

class _OtpLoginPageState extends State<OtpLoginPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Логин',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: height*.02,
                left: width*.05
            ),
            height: height*.17,
            width: width*.9,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: height*.01,
                      left: width*.05
                  ),
                  child: Text('Телефон номер'),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: height*.01,
                    left: width*.05,
                    right: width*.05,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey
                            )
                        )
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: height*.01,
                      left: width*.05
                  ),
                  child: Text('Отправить заново',style: TextStyle(color: Colors.black),),
                ),
              ],
            ),
          ),

        ],
      ),
      bottomSheet: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(
              bottom: height*.05,
              left: width*.05
          ),
          height: height*.07,
          width: width*.9,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: Text('Логин',style: TextStyle(color: Colors.white),),
          ),
        ),
        onTap: (){

          Get.offAllNamed(AppRoutes.main);
        },
      ),

    );
  }
}
