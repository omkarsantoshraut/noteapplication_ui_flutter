import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:noteapplication_ui_flutter/utils/constants/app_strings.dart' as app_strings;

Future<List<dynamic>> fetchAllNotes() async {
  try {
    var url = Uri.parse(app_strings.baseURL + app_strings.fetchAllNotes);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      // print(response);
      List<dynamic> jsonResponse = jsonDecode(response.body);
      // Handle the response data
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (error) {
    print(error);
  }
  return [];
}
