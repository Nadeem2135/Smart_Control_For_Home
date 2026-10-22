import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class GarageScreen extends StatefulWidget {
  const GarageScreen({super.key});

  @override
  State<GarageScreen> createState() => _StoreScreen();
}

class _StoreScreen extends State<GarageScreen> {


  bool notifications1 = false;
  bool notifications2 = false;
  late final height = MediaQuery.of(context).size.height * 1;
  late final width = MediaQuery.of(context).size.width * 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.grey[800]
        ),
        title: Text("Garage", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800]),),
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
                Text("Light", style: TextStyle(fontSize: 18, color: Colors.grey[800], fontWeight: FontWeight.bold),),
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
                Text("Rolling Door", style: TextStyle(fontSize: 18, color: Colors.grey[800], fontWeight: FontWeight.bold),),
                CupertinoSwitch(value: notifications2, onChanged: (value){
                  notifications2 = value;
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
