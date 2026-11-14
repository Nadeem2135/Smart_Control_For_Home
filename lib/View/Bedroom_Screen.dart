import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BedroomScreen extends StatefulWidget {
  const BedroomScreen({super.key});

  @override
  State<BedroomScreen> createState() => _BedroomScreenState();
}

class _BedroomScreenState extends State<BedroomScreen> {


  bool notifications1 = false;
  bool notifications2 = false;
  bool notifications3 = false;
  bool notifications4 = false;
  late final height = MediaQuery.of(context).size.height * 1;
  late final width = MediaQuery.of(context).size.width * 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.grey[800],
        ),
        title: Text("Bedroom", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800]),),
        centerTitle: true,
        // backgroundColor: Color(0xff22242A),
        backgroundColor: Colors.grey[300],
        actions: [
          Icon(Icons.bluetooth, color: Colors.red,),
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
                             CupertinoSwitch(value: notifications1, onChanged: (value){
                               notifications1 = value;
                               setState(() {

                               });
                             }),
                           ],
                         ),
                         Image.asset("assets/icons/fan.png", height: 50, width: 50, color: notifications1 ? Colors.green : Colors.red,),
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
                              Text("Light", style: TextStyle(fontSize: 15, color: Colors.grey[800], fontWeight: FontWeight.bold),),
                              SizedBox(height: 15,),
                              CupertinoSwitch(value: notifications2, onChanged: (value){
                                notifications2 = value;
                                setState(() {

                                });
                              }),
                            ],
                          ),
                          Image.asset("assets/icons/idea.png", height: 50, width: 50, color: notifications2 ? Colors.green : Colors.red,),
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
                              Text("TV", style: TextStyle(fontSize: 15, color: Colors.grey[800], fontWeight: FontWeight.bold),),
                              SizedBox(height: 15,),
                              CupertinoSwitch(value: notifications3, onChanged: (value){
                                notifications3 = value;
                                setState(() {

                                });
                              }),
                            ],
                          ),
                          Image.asset("assets/icons/smart-tv.png", height: 50, width: 50, color: notifications3 ? Colors.green : Colors.red,),
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
                              Text("Air Conditioner", style: TextStyle(fontSize: 15, color: Colors.grey[800], fontWeight: FontWeight.bold),),
                              SizedBox(height: 15,),
                              CupertinoSwitch(value: notifications4, onChanged: (value){
                                notifications4 = value;
                                setState(() {

                                });
                              }),
                            ],
                          ),
                          Image.asset("assets/icons/air-conditioner.png", height: 50, width: 50, color: notifications4 ? Colors.green : Colors.red,),
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
