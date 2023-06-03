import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:noteapplication_ui_flutter/utils/constants/app_strings.dart' as app_strings;

void updateNoteWithID(String id, String title, String details, String createdAt) async {
  var url = Uri.parse(app_strings.baseURL + app_strings.updateNote + id);
  // String singleLineString = details.replaceAll(RegExp(r'\n'), '\\n');
  print(createdAt);
  var requestBody = {
    'title': title,
    'details': details,
    'createdAt': createdAt
  };
  var response = await http.put(
    url,
    body: jsonEncode(requestBody),
    headers: {'Content-Type': 'application/json'},
  );

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
