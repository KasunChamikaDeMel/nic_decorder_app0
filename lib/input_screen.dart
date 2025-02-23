import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'nic_controller.dart';

class InputScreen extends StatelessWidget {
  final NICController controller = Get.put(NICController());         // Initialize GetX controller for NIC processing
  final TextEditingController nicController = TextEditingController();        // Controller for NIC input text field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ghost NIC Decoder'), backgroundColor: Colors.blueAccent, centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter Your NIC Number',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // NIC input field
            TextField(
              controller: nicController,
              decoration: InputDecoration(
                labelText: 'NIC Number',
                hintText: 'eg: 123456789v or 123456789123',
                prefixIcon: Icon(Icons.badge),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Decode action button
            ElevatedButton(
              onPressed: () {
                if (nicController.text.isEmpty) {      // Input validation
                  Get.snackbar('Error', 'Please enter NIC');
                  return;
                }

                // Process NIC through controller
                controller.decodeNIC(nicController.text.trim());
                if (controller.errorMessage.isEmpty) {
                  Get.toNamed('/result');
                } else {
                  Get.snackbar('Error', controller.errorMessage.value);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Decode NIC',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
