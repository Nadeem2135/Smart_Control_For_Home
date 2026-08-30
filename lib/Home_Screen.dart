import 'package:flutter/material.dart';
import 'package:smooth_transition/smooth_transition.dart';
import 'Bedroom_Screen.dart';
import 'Gerage_Screen.dart';
import 'Kitchen_Screen.dart';
import 'LivingRoom_Screen.dart';
import 'Store_Screen.dart';
import 'Study_Room_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 // late final height = MediaQuery.of(context).size.height * 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hello User", style: TextStyle(color: Colors.white),),
              SizedBox(width: 7,),
              Icon(Icons.waving_hand, color: Colors.amber,),
              SizedBox(width: 7,),
              Text("Welcome to Home", style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color(0xff22242A),
        actions: [

        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Color(0xff30324D),
      //   onPressed: (){}, child: Icon(Icons.add, color: Colors.white,),
      // ),

      backgroundColor: Color(0xff22242A),
      body: Column(
        children: [
          const SizedBox(height: 40,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView(

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30.0,
                  mainAxisSpacing: 30.0,
                  childAspectRatio: 1.0,
                ),

                children: [
                  InkWell(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (_) => StudyRoomScreen()));
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const StudyRoomScreen(),
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOutBack,
                        ),
                      );
                    },
                    child: Container(

                        decoration: BoxDecoration(
                          color: Color(0xff2C2E35),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 40,
                                // child: Image.asset('assets/study_room.png', fit: BoxFit.cover,),
                                backgroundImage: AssetImage('assets/study_room.png'),
                            ),
                            SizedBox(height: 5,),
                            Text("Study Room", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                            SizedBox(height: 5,),
                            Text("3 Devices", style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => BedroomScreen()));
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const BedroomScreen(),
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOutBack,
                        ),
                      );

                    },
                    child: Container(

                      decoration: BoxDecoration(
                        color: Color(0xff2C2E35),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                radius: 40,
                                // child: Image.asset('bedroom.png', fit: BoxFit.cover,),
                                backgroundImage: AssetImage('assets/bedroom.png'),
                            ),
                            SizedBox(height: 5,),
                            Text("Bedroom", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                            SizedBox(height: 5,),
                            Text("4 Devices",  style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => KitchenScreen()));
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const KitchenScreen(),
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOutBack,
                        ),
                      );
                    },
                    child: Container(

                      decoration: BoxDecoration(
                        color: Color(0xff2C2E35),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                radius: 40,
                                // child: Image.asset('kitchen.png', fit: BoxFit.cover,),
                                backgroundImage: AssetImage('assets/kitchen.png',),
                            ),
                            SizedBox(height: 5,),
                            Text("Kitchen", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                            SizedBox(height: 5,),
                            Text("5 Devices",  style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => LivingRoomScreen()));
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const LivingRoomScreen(),
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOutBack,
                        ),
                      );
                    },
                    child: Container(

                      decoration: BoxDecoration(
                        color: Color(0xff2C2E35),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                radius: 40,
                                // child: Image.asset('living_room.png', fit: BoxFit.cover,),
                                backgroundImage: AssetImage('assets/living_room.png'),
                            ),
                            SizedBox(height: 5,),
                            Text("Living Room", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                            SizedBox(height: 5,),
                            Text("4 Devices",  style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => StoreScreen()));
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const StoreScreen(),
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOutBack,
                        ),
                      );
                    },
                    child: Container(

                      decoration: BoxDecoration(
                        color: Color(0xff2C2E35),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                radius: 40,
                                // child: Image.asset('store.png', fit: BoxFit.cover,),
                                backgroundImage: AssetImage('assets/store.png'),
                            ),
                            SizedBox(height: 5,),
                            Text("Store", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                            SizedBox(height: 5,),
                            Text("3 Devices",  style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => GarageScreen()));
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const GarageScreen(),
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOutBack,
                        ),
                      );
                    },
                    child: Container(

                      decoration: BoxDecoration(
                        color: Color(0xff2C2E35),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                radius: 40,
                                // child: Image.asset('garage.png', fit: BoxFit.cover,),
                                backgroundImage: AssetImage('assets/garage.png'),
                            ),
                            SizedBox(height: 5,),
                            Text("Garage", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                            SizedBox(height: 5,),
                            Text("2 Devices",  style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
