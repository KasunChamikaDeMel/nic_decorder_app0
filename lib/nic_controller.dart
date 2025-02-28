import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NICController extends GetxController {            
  Rx<DateTime> birthDate = DateTime.now().obs;          // State variables
  RxString gender = ''.obs;
  RxString weekday = ''.obs;
  RxInt age = 0.obs;
  RxString errorMessage = ''.obs;
  RxString nicFormat = ''.obs; // New variable to store NIC format

  void decodeNIC(String nic) {          // Main decoding entry point
    resetValues();
    try {
      if (isOldFormat(nic)) {
        nicFormat.value = 'Old NIC Format'; // Set NIC format
        processOldNIC(nic);
      } else if (isNewFormat(nic)) {
        nicFormat.value = 'New NIC Format'; // Set NIC format
        processNewNIC(nic);
      } else {
        throw FormatException('Invalid NIC format');
      }
    } catch (e) {
      errorMessage.value = 'Error: ${e.toString()}';
    }
  }

  // Validate old NIC format
  bool isOldFormat(String nic) {
    return nic.length == 10 && RegExp(r'^[0-9]{9}[A-Za-z]$').hasMatch(nic);
  }

  // Validate new NIC format
  bool isNewFormat(String nic) {
    return nic.length == 12 && RegExp(r'^[0-9]{12}$').hasMatch(nic);
  }

  // Process old NIC format
  void processOldNIC(String nic) {
    int year = 1900 + int.parse(nic.substring(0, 2));
    int dayCode = int.parse(nic.substring(2, 5));
    processCommon(year, dayCode);
  }

  // Process new NIC format
  void processNewNIC(String nic) {
    int year = int.parse(nic.substring(0, 4));
    int dayCode = int.parse(nic.substring(4, 7));
    processCommon(year, dayCode);
  }
  
  // Common processing for both old and new formats
  void processCommon(int year, int dayCode) {
    gender.value = dayCode < 500 ? 'Male' : 'Female';
    int dayOfYear = dayCode < 500 ? dayCode : dayCode - 500;
    calculateDate(year, dayOfYear);
  }

  // Convert day to date
  void calculateDate(int year, int dayOfYear) {
    try {
      final date = DateTime(year).add(Duration(days: dayOfYear - 1));
      if (date.year != year) throw Exception('Invalid day');
      birthDate.value = date;
      weekday.value = DateFormat('EEEE').format(date);
      calculateAge(date);
    } catch (e) {
      errorMessage.value = 'Invalid date: $dayOfYear';
    }
  }

  // Calculate age from birth date
  void calculateAge(DateTime dob) {
    DateTime now = DateTime.now();
    int years = now.year - dob.year;
    if (now.month < dob.month || (now.month == dob.month && now.day < dob.day)) {
      years--;
    }
    age.value = years;
  }

  // Reset all values to default
  void resetValues() {
    birthDate.value = DateTime.now();
    gender.value = '';
    weekday.value = '';
    age.value = 0;
    errorMessage.value = '';
    nicFormat.value = ''; // Reset NIC format
  }
}