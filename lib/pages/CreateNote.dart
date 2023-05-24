import 'package:flutter/material.dart';
import 'package:noteapplication_ui_flutter/pages/home_page.dart';

import 'package:noteapplication_ui_flutter/utils/constants/app_measurments.dart' as app_measure;
import 'package:noteapplication_ui_flutter/utils/constants/app_strings.dart' as app_strings;

class CreateNote extends StatefulWidget {
  const CreateNote({
    super.key,
    this.id = '',
    this.title = '',
    this.details = '',
  });

  final String id;
  final String title;
  final String details;

  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNote> {
  final TextEditingController _noteTitleController = TextEditingController();
  final TextEditingController _noteDetailsController = TextEditingController();
  // TextFormField validation global keys
  final _createNoteFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    if (widget.id != '') {
      _noteTitleController.text = widget.title;
      _noteDetailsController.text = widget.details;
    }
  }

  @override
  void dispose() {
    _noteTitleController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_createNoteFormKey.currentState!.validate()) {
      String noteText = _noteTitleController.text;
      String d = _noteDetailsController.text;
      // Perform further actions with the note, such as saving it to a database or displaying it in another widget
      print('Note: $noteText, $d');
      showSuccessNotification(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    var deviceMedia = MediaQuery.of(context);
    final double screenHeight = deviceMedia.size.height - deviceMedia.padding.top - deviceMedia.padding.bottom;
    final double screenWidth = deviceMedia.size.width - deviceMedia.padding.left - deviceMedia.padding.right;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(app_strings.createNoteHeaderName),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(app_measure.height16 * screenWidth),
          child: Form(
            key: _createNoteFormKey,
            child: Column(
              children: [
                SizedBox(height: app_measure.height16 * screenHeight),
      
                TextFormField(
                  controller: _noteTitleController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: app_strings.noteTitleFormFieldLabel,
                    labelStyle: TextStyle(
                      fontSize: app_measure.height24 * screenHeight,
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty || value == '') {
                      return app_strings.requirednoteTitleFormFieldLabelError;
                    }
                    return null;
                  },
                ),
      
                SizedBox(height: app_measure.height16 * screenHeight),
      
                TextFormField(
                  controller: _noteDetailsController,
                  maxLines: 10,
                  decoration: InputDecoration(
                    labelText: app_strings.noteDetailsFormFieldLabel,
                    labelStyle: TextStyle(
                      fontSize: app_measure.height18 * screenHeight,
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
      
                SizedBox(height: app_measure.height16 * screenHeight),
      
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(Colors.green),
                    fixedSize: MaterialStatePropertyAll(Size(screenWidth - app_measure.height186 * screenWidth, app_measure.height40 * screenHeight))
                  ),
                  child: Text(
                    app_strings.submitButtonLabel,
                    style: TextStyle(
                      fontSize: app_measure.height18 * screenHeight,
                      fontWeight: FontWeight.w700,
                      color: Colors.white
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

  void showSuccessNotification(BuildContext context) {
    const snackBar = SnackBar(
      content: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green),
          SizedBox(width: 8.0),
          Text(app_strings.successCreatedNoteMessage),
        ],
      ), 
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

