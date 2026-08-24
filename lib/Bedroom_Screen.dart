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
            color: Colors.white
        ),
        title: Text("Bedroom", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        centerTitle: true,
        backgroundColor: Color(0xff1F243B),
      ),
      backgroundColor: Color(0xff1F243B),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [

            SizedBox(height: height * .05,),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text("Ceiling Fan", style: TextStyle(fontSize: 18, color: Colors.white),),
                Switch(value: notifications1, onChanged: (value){
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
                Text("Light", style: TextStyle(fontSize: 18, color: Colors.white),),
                Switch(value: notifications2, onChanged: (value){
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
                Text("TV", style: TextStyle(fontSize: 18, color: Colors.white),),
                Switch(value: notifications3, onChanged: (value){
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
                Text("AC", style: TextStyle(fontSize: 18, color: Colors.white),),
                Switch(value: notifications4, onChanged: (value){
                  notifications4 = value;
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
