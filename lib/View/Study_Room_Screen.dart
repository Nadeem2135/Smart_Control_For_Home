import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../Controller/Study_Screen_Controller.dart';


class StudyRoomScreen extends StatefulWidget {
  const StudyRoomScreen({super.key});

  @override
  State<StudyRoomScreen> createState() => _StudyRoomScreenState();
}

class _StudyRoomScreenState extends State<StudyRoomScreen> {


  late final height = MediaQuery.of(context).size.height * 1;
  late final width = MediaQuery.of(context).size.width * 1;

  final StudyScreenController controller = Get.put(StudyScreenController());

  @override
  Widget build(BuildContext context) {

    print("Rebuild");
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey[800]
        ),
        title: Text("Study Room", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800]),),
        centerTitle: true,
        // backgroundColor: Color(0xff22242A),
        backgroundColor: Colors.grey[300],
        actions: [
          Obx(() => InkWell(
            onTap: (){
              controller.initiateBluetoothConnection();
            },
              child: Icon(controller.isConnected.value ? Icons.bluetooth : Icons.bluetooth, color: controller.isConnected.value ? Color(0xff39FF14) : Color(0xffF2003D))
          ),
          ),
          SizedBox(width: 15,),
        ],
      ),
      // backgroundColor: Color(0xff22242A),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [

              SizedBox(height: height * .05,),

              Container(
                height: 100,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [

                          Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text("Ceiling Fan", style: TextStyle(fontSize: 15, color: Colors.grey[800], fontWeight: FontWeight.bold),),
                              SizedBox(height: 15,),
                              Obx(() =>  CupertinoSwitch(value: controller.notifications1.value, onChanged: (value){
                                controller.setNotifications1(value);
                              }),),
                            ],
                          ),
                          Obx(() => Image.asset("assets/icons/fan.png", height: 50, width: 50, color: controller.notifications1.value ? Colors.green : Colors.red,),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 100,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [

                          Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text("Light", style: TextStyle(fontSize: 15, color: Colors.grey[800], fontWeight: FontWeight.bold),),
                              SizedBox(height: 15,),
                              Obx(() =>  CupertinoSwitch(value: controller.notifications2.value, onChanged: (value){
                                controller.setNotifications2(value);
                              }),),
                            ],
                          ),
                          Obx(() => Image.asset("assets/icons/idea.png", height: 50, width: 50, color: controller.notifications2.value ? Colors.green : Colors.red,),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 100,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [

                          Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text("Smart TV", style: TextStyle(fontSize: 15, color: Colors.grey[800], fontWeight: FontWeight.bold),),
                              SizedBox(height: 15,),
                              Obx(() =>  CupertinoSwitch(value: controller.notifications3.value, onChanged: (value){
                                controller.setNotifications3(value);
                              }),),
                            ],
                          ),
                          Obx(() => Image.asset("assets/icons/smart-tv.png", height: 50, width: 50, color: controller.notifications3.value ? Colors.green : Colors.red,),),
                        ],
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}




