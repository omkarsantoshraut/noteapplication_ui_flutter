import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:noteapplication_ui_flutter/utils/constants/app_strings.dart' as app_strings;

void deleteNoteWithID(String id) async {
  var url = Uri.parse(app_strings.baseURL + app_strings.deleteNote + id);
  var response = await http.delete(url );

  if (response.statusCode == 200) {
    // Request successful, handle the response
    var jsonResponse = jsonDecode(response.body);
    // Process the response data
    print(jsonResponse);
  } else {
    // Request failed
    print('Request failed with status: ${response.statusCode}.');
  }
}
