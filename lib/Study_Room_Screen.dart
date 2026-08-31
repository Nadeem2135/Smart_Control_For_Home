import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'Controller/Study_Screen_Controller.dart';


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
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text("Study Room", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        centerTitle: true,
        backgroundColor: Color(0xff22242A),
        actions: [
          Obx(() => InkWell(
            onTap: (){
              controller.initiateBluetoothConnection();
            },
              child: Icon(controller.isConnected.value ? Icons.bluetooth : Icons.bluetooth, color: controller.isConnected.value ? Color(0xff39FF14) : Color(0xffF2003D))
          ),
          ),
          SizedBox(width: 10,),
        ],
      ),
      backgroundColor: Color(0xff22242A),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [

            SizedBox(height: height * .05,),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text("Ceiling Fan", style: TextStyle(fontSize: 18, color: Colors.white),),
                Obx(() =>   Switch(value: controller.notifications1.value, onChanged: (value){
                  controller.setNotifications1(value);

                }),),
              ],
            ),
            SizedBox(height: height * .05,),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text("Light", style: TextStyle(fontSize: 18, color: Colors.white),),
                Obx(() => Switch(value: controller.notifications2.value, onChanged: (value){
                  controller.setNotifications2(value);
                }),),

              ],
            ),
            SizedBox(height: height * .05,),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text("TV", style: TextStyle(fontSize: 18, color: Colors.white),),
                Obx(() =>  Switch(value: controller.notifications3.value, onChanged: (value){
                  controller.setNotifications3(value);
                }),),

              ],
            ),

          ],
        ),
      ),
    );
  }
}




