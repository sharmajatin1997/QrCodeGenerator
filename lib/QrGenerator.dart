import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_scanner_and_generator/QrController.dart';

class QrGenerator extends StatelessWidget {
  QrGenerator({Key? key}) : super(key: key);

  final controller = Get.put(QrController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Generate QR Code")),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          //Scroll view given to Column
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                QrImage(data: controller.qrData.value),
                const SizedBox(height: 20),
                const Text(
                  "Generate QR Code",
                  style: TextStyle(fontSize: 20),
                ),

                //TextField for input link
                TextField(
                  controller: controller.qrdataFeed,
                  decoration: InputDecoration(hintText: "Enter your link here..."),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  //Button for generating QR code
                  child: ElevatedButton(
                    onPressed: () async {
                      //a little validation for the textfield
                      controller.qrData.value = controller.qrdataFeed.text;
                    },
                    //Title given on Button
                    child: Text(
                      "Generate QR Code",
                      style: TextStyle(
                        color: Colors.indigo[900],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
