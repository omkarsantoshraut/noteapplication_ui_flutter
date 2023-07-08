import 'package:http/http.dart' as http;
import 'package:noteapplication_ui_flutter/server_models/noteServerModel.dart';
import 'dart:convert';

import 'package:noteapplication_ui_flutter/utils/constants/app_strings.dart' as app_strings;

void updateNoteWithID(String id, String title, String details, String createdAt) async {
  var url = Uri.parse(app_strings.baseURL + app_strings.updateNote + id);
  NoteServerModel requestBody = NoteServerModel(noteTitle: title, noteDetails: details, createdAt: createdAt);
  var response = await http.put(
    url,
    body: jsonEncode(requestBody.toJsonForUpdateNote()),
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
