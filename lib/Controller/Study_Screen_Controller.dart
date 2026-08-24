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
import 'package:get/get.dart';
import 'package:flutter_classic_bluetooth/flutter_classic_bluetooth.dart';

class StudyScreenController extends GetxController {
  RxBool notifications1 = false.obs;
  RxBool notifications2 = false.obs;
  RxBool notifications3 = false.obs;

  // Track the connection state reactively
  RxBool isConnected = false.obs;

  // Initialize the correct engine instance cleanly
  final FlutterClassicBluetooth _bluetooth = FlutterClassicBluetooth();
  final String _targetDeviceName = "ESP32_Relay_Controller";

  // Store the active connection instance object returned by flutter_classic_bluetooth
  BtcConnection? _activeConnection;

  @override
  void onInit() {
    super.onInit();
    _initiateBluetoothConnection(); // Auto-connect when controller initializes
  }



  // 1. REWRITTEN BLUETOOTH CONNECTION FUNCTION
  void _initiateBluetoothConnection() async {
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
          Get.snackbar("Connected", "Successfully linked to Study Room controller.",
              snackPosition: SnackPosition.BOTTOM);

          // Use standard streams for incoming data communication
          _activeConnection!.input?.listen((Uint8List rawBytes) {
            String incomingMessage = utf8.decode(rawBytes);
            print("Received from ESP32: $incomingMessage");
          }, onDone: () {
            // Handle accidental disconnection or range drop
            isConnected.value = false;
            _activeConnection = null;
            Get.snackbar("Disconnected", "Room controller pipeline dropped.",
                snackPosition: SnackPosition.BOTTOM);
          });

        } else {
          isConnected.value = false;
          Get.snackbar("Connection Failed", "Could not establish pipeline link.",
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        Get.snackbar("Error", "ESP32 not found. Pair it in Bluetooth settings first.",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      isConnected.value = false;
      Get.snackbar("Connection Error", "Could not connect: $e",
          snackPosition: SnackPosition.BOTTOM);
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
      Get.snackbar("Offline", "Not connected to the room controller.",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // 2. SEPARATE RELAY CONTROL FUNCTIONS (Untouched API Signature)
  void setNotifications1(bool value){
    notifications1.value = value;
    _sendBluetoothCommand("1"); // Sends '1' to toggle Ceiling Fan
  }

  void setNotifications2(bool value){
    notifications2.value = value;
    _sendBluetoothCommand("2"); // Sends '2' to toggle Light
  }

  void setNotifications3(bool value){
    notifications3.value = value;
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







