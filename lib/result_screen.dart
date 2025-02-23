import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'nic_controller.dart';

class ResultScreen extends StatelessWidget {
  final NICController controller = Get.find();  // Access existing NIC controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Decoded NIC Info'), backgroundColor: Colors.blueAccent, centerTitle: true,
      ),

      // Reactive UI with Obx
      body: Obx(() => Padding(
            padding: EdgeInsets.all(16.0),
            child: controller.errorMessage.isNotEmpty
                ? Center(
                    child: Text(
                      controller.errorMessage.value,
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    ),
                  )
                : Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildInfoRow(
                                'Birth Date:',
                                DateFormat('yyyy-MM-dd')
                                    .format(controller.birthDate.value),
                                Icons.cake),
                            buildInfoRow(
                                'Weekday:', controller.weekday.value, Icons.calendar_today),
                            buildInfoRow(
                                'Age:', controller.age.value.toString(), Icons.hourglass_bottom),
                            buildInfoRow(
                                'Gender:', controller.gender.value, Icons.person),
                          ],
                        ),
                      ),
                    ),
                  ),
          )),
    );
  }

  // Helper method to create consistent info rows
  Widget buildInfoRow(String title, String value, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 5),
          Text(
            value,     // Actual value display
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
