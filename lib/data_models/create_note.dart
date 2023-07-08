import 'package:http/http.dart' as http;
import 'package:noteapplication_ui_flutter/server_models/noteServerModel.dart';
import 'dart:convert';

import 'package:noteapplication_ui_flutter/utils/constants/app_strings.dart' as app_strings;

void createNoteWithData(String title, String details) async {
  var url = Uri.parse(app_strings.baseURL + app_strings.createNote);
  NoteServerModel requestBody = NoteServerModel(noteTitle: title, noteDetails: details);
  var response = await http.post(
    url,
    body: jsonEncode(requestBody.toJson()),
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
