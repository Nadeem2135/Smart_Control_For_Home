import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class KitchenScreen extends StatefulWidget {
  const KitchenScreen({super.key});

  @override
  State<KitchenScreen> createState() => _KitchenScreenState();
}

class _KitchenScreenState extends State<KitchenScreen> {


  bool notifications1 = false;
  bool notifications2 = false;
  bool notifications3 = false;
  bool notifications4 = false;
  bool notifications5 = false;
  late final height = MediaQuery.of(context).size.height * 1;
  late final width = MediaQuery.of(context).size.width * 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.grey[800],
        ),
        title: Text("Kitchen", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800]),),
        centerTitle: true,
        // backgroundColor: Color(0xff22242A),
        backgroundColor: Colors.grey[300],
      ),
      // backgroundColor: Color(0xff22242A),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [

            SizedBox(height: height * .05,),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text("Fridge", style: TextStyle(fontSize: 18, color: Colors.grey[800], fontWeight: FontWeight.bold),),
                CupertinoSwitch(value: notifications1, onChanged: (value){
                  notifications1 = value;
                  setState(() {

                  });
                }),
              ],
            ),
            SizedBox(height: height * .05,),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text("Light", style: TextStyle(fontSize: 18, color: Colors.grey[800], fontWeight: FontWeight.bold),),
                CupertinoSwitch(value: notifications2, onChanged: (value){
                  notifications2 = value;
                  setState(() {

                  });
                }),
              ],
            ),
            SizedBox(height: height * .05,),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text("Fan", style: TextStyle(fontSize: 18, color: Colors.grey[800], fontWeight: FontWeight.bold),),
                CupertinoSwitch(value: notifications3, onChanged: (value){
                  notifications3 = value;
                  setState(() {

                  });
                }),
              ],
            ),
            SizedBox(height: height * .05,),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text("Oven", style: TextStyle(fontSize: 18, color: Colors.grey[800], fontWeight: FontWeight.bold),),
                CupertinoSwitch(value: notifications4, onChanged: (value){
                  notifications4 = value;
                  setState(() {

                  });
                }),
              ],
            ),
            SizedBox(height: height * .05,),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text("Exhaust", style: TextStyle(fontSize: 18, color: Colors.grey[800], fontWeight: FontWeight.bold),),
                CupertinoSwitch(value: notifications5, onChanged: (value){
                  notifications5 = value;
                  setState(() {

                  });
                }),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
