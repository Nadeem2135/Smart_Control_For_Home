// import 'package:get/get.dart';
//
//
// class StudyScreenController extends GetxController {
//
//
//   RxBool notifications1 = false.obs;
//   RxBool notifications2 = false.obs;
//   RxBool notifications3 = false.obs;
//
//   void setNotifications1(bool value){
//     notifications1.value = value;
//   }
//
//   void setNotifications2(bool value){
//     notifications2.value = value;
//   }
//
//   void setNotifications3(bool value){
//     notifications3.value = value;
//   }
//
// }





import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter_classic_bluetooth/flutter_classic_bluetooth.dart';
import 'package:get_storage/get_storage.dart';

class StudyScreenController extends GetxController {
  RxBool notifications1 = false.obs;
  RxBool notifications2 = false.obs;
  RxBool notifications3 = false.obs;

  // Track the connection state reactively
  RxBool isConnected = false.obs;

  // Initialize the correct engine instance cleanly
  final FlutterClassicBluetooth _bluetooth = FlutterClassicBluetooth();
  final String _targetDeviceName = "ESP32_Relay_Controller";
  final box = GetStorage();

  // Store the active connection instance object returned by flutter_classic_bluetooth
  BtcConnection? _activeConnection;

  @override
  void onInit() {
    super.onInit();
    initiateBluetoothConnection(); // Auto-connect when controller initializes
    loadSavedStates();
  }



  // Load saved States
  void loadSavedStates(){
    notifications1.value = box.read('notifications1') ?? false;
    notifications2.value = box.read('notifications2') ?? false;
    notifications3.value = box.read('notifications3') ?? false;
  }



  // 1. REWRITTEN BLUETOOTH CONNECTION FUNCTION
  void initiateBluetoothConnection() async {
    try {
      // Fetch paired devices from phone system storage
      List<BtcDevice> bondedDevices = await _bluetooth.getPairedDevices();
      BtcDevice? targetDevice;

      for (BtcDevice device in bondedDevices) {
        if (device.name == _targetDeviceName) {
          targetDevice = device;
          break;
        }
      }

      if (targetDevice != null) {
        // flutter_classic_bluetooth uses a named parameter 'address:'
        _activeConnection = await _bluetooth.connect(address: targetDevice.address);

        if (_activeConnection != null) {
          isConnected.value = true;
          Get.snackbar(
              "Connected", "Successfully linked to Study Room controller.",
              snackPosition: SnackPosition.TOP,
              backgroundColor: Color(0xff2C2E35),
              duration: Duration(seconds: 2),
              colorText: Color(0xffffffff),
          );

          // Use standard streams for incoming data communication
          _activeConnection!.input?.listen((Uint8List rawBytes) {
            String incomingMessage = utf8.decode(rawBytes);
            print("Received from ESP32: $incomingMessage");
          }, onDone: () {
            // Handle accidental disconnection or range drop
            isConnected.value = false;
            _activeConnection = null;
            Get.snackbar(
                "Disconnected", "Room controller pipeline dropped.",
                snackPosition: SnackPosition.TOP,
                backgroundColor: Color(0xff2C2E35),
                duration: Duration(seconds: 2),
                colorText: Color(0xffffffff),
            );
          });

        } else {
          isConnected.value = false;
          Get.snackbar(
              "Connection Failed", "Could not establish pipeline link.",
              snackPosition: SnackPosition.TOP,
              backgroundColor: Color(0xff2C2E35),
              duration: Duration(seconds: 2),
              colorText: Color(0xffffffff),
          );
        }
      } else {
        Get.snackbar(
            "Error", "ESP32 not found. Pair it in Bluetooth settings first.",
            snackPosition: SnackPosition.TOP,
            // backgroundColor: Color(0xffffffff),
            backgroundColor: Color(0xff2C2E35),
            duration: Duration(seconds: 2),
            colorText: Color(0xffffffff),
        );
      }
    } catch (e) {
      isConnected.value = false;
      Get.snackbar(
          "Connection Error", "Could not connect: $e",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Color(0xff2C2E35),
          duration: Duration(seconds: 2),
          colorText: Color(0xffffffff),
      );
    }
  }

  // Helper function rewritten to use pure stream-based Sink operations
  void _sendBluetoothCommand(String command) async {
    if (isConnected.value && _activeConnection != null) {
      try {
        // Convert string payload into raw byte buffers (Uint8List) as required
        final Uint8List bytes = utf8.encode("$command\n");

        // Push bytes straight to the active connection sink output
        _activeConnection!.output.add(bytes);
        await _activeConnection!.output.allSent;
      } catch (e) {
        print("Error sending data: $e");
      }
    } else {
      Get.snackbar(
          "Offline", "Not connected to the room controller.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Color(0xff2C2E35),
          duration: Duration(seconds: 2),
          colorText: Color(0xffffffff),
      );
    }
  }

  // 2. SEPARATE RELAY CONTROL FUNCTIONS (Untouched API Signature)
  void setNotifications1(bool value){
    notifications1.value = value;
    box.write('notifications1', value);
    _sendBluetoothCommand("1"); // Sends '1' to toggle Ceiling Fan
  }

  void setNotifications2(bool value){
    notifications2.value = value;
    box.write('notifications2', value);
    _sendBluetoothCommand("2"); // Sends '2' to toggle Light
  }

  void setNotifications3(bool value){
    notifications3.value = value;
    box.write('notifications3', value);
    _sendBluetoothCommand("3"); // Sends '3' to toggle TV
  }

  @override
  void onClose() {
    if (_activeConnection != null) {
      // Clean up the wireless stream socket channel elegantly
      _activeConnection!.close();
    }
    super.onClose();
  }
}







