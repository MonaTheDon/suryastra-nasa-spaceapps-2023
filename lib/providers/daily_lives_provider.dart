import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DailyLivesProvider extends ChangeNotifier {
  String _month = "";
  String _year = "";
  int _magneticReconnectionValue = -1;
  String _monthYearImageUrl = "";
  String _date = "";
  String _yearImageUrl = "";
  bool _isFetchingData = false;
  bool _isFetchingData2 = false;
  bool _isFetchingData3 = false;

  final List<String> _months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  final Map<String, int> _monthValueMap = {
    "January": 1,
    "February": 2,
    "March": 3,
    "April": 4,
    "May": 5,
    "June": 6,
    "July": 7,
    "August": 8,
    "September": 9,
    "October": 10,
    "November": 11,
    "December": 12
  };

  final List<String> _years =
      List.generate(23, (index) => (1998 + index).toString());

  String get month => _month;
  String get year => _year;
  List<String> get months => _months;
  List<String> get years => _years;
  int get magneticReconnectionValue => _magneticReconnectionValue;
  String get monthYearImageUrl => _monthYearImageUrl;
  String get yearImageUrl => _yearImageUrl;
  Map<String, int> get monthValueMap => _monthValueMap;
  bool get isFetchingData => _isFetchingData;
  bool get isFetchingData2 => _isFetchingData2;
  bool get isFetchingData3 => _isFetchingData3;
  String get date => _date;

  set month(String value) {
    _month = value;
    notifyListeners();
  }

  set year(String value) {
    _year = value;
    notifyListeners();
  }

  set date(String value) {
    _date = value;
    notifyListeners();
  }

  Future<void> getPlotForMonthYear(int month, int year) async {
    try {
      _isFetchingData = true;
      notifyListeners();
      final response = await http.get(Uri.parse(
          "https://altmxx.pythonanywhere.com/generate_plot_for_month_year_values/$year/$month"));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponseMap = jsonDecode(response.body);
        Map<String, dynamic> dailyCounts = jsonResponseMap['daily_counts'];
        _monthYearImageUrl = jsonResponseMap['upload_url'];
        log(_monthYearImageUrl);
        int countOfOnes =
            dailyCounts.values.where((element) => element == 1).length;
        _magneticReconnectionValue = countOfOnes;
        notifyListeners();
      }
    } catch (e) {
      log("There was an error in getPlotForMonthYear function in DailyLivesProvider${e.toString()}");
    } finally {
      _isFetchingData = false;
      notifyListeners();
    }
  }

  Future<void> getPlotForYear(int year) async {
    try {
      _isFetchingData2 = true;
      _yearImageUrl = "";

      notifyListeners();
      final response = await http.get(Uri.parse(
          "https://altmxx.pythonanywhere.com/generate_plot_and_get_counts/$year"));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponseMap = jsonDecode(response.body);
        // Map<String, dynamic> dailyCounts = jsonResponseMap['monthly_counts'];
        _yearImageUrl = jsonResponseMap['upload_url'];
        notifyListeners();
        log("Year Image URL is $_yearImageUrl");
        // int countOfOnes =
        //     dailyCounts.values.where((element) => element == 1).length;
        // _magneticReconnectionValue = countOfOnes;
      }
    } catch (e) {
      log("There was an error in getPlotForYear function in DailyLivesProvider${e.toString()}");
    } finally {
      _isFetchingData2 = false;
      notifyListeners();
    }
  }

  Future<bool?> checkMRonGivenDate(String date) async {
    try {
      _isFetchingData3 = true;
      notifyListeners();
      final response = await http.get(Uri.parse(
          "https://altmxx.pythonanywhere.com/check_mr_value_on_given_date?date=$date"));
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponseMap = jsonDecode(response.body);
        notifyListeners();
        log("The json response map in checkMROnGivenDate is: ${jsonResponseMap.toString()}");
        return jsonResponseMap["result"];
      }
    } catch (e) {
      log("Exception in checkMRonGivenDate function: ${e.toString()}");
    } finally {
      _isFetchingData3 = false;
      // Return null to satisfy the nullable return type
      // return null;
    }
  }
}
