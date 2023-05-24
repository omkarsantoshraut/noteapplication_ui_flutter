import 'package:flutter/material.dart';

import 'package:noteapplication_ui_flutter/utils/constants/app_measurments.dart' as app_measure;
import 'package:noteapplication_ui_flutter/utils/constants/app_strings.dart' as app_strings;
import 'package:noteapplication_ui_flutter/pages/CreateNote.dart';
import 'package:noteapplication_ui_flutter/utils/widgets/noteCard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
        title: const Text(app_strings.appHeaderName),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: app_measure.height16 * screenWidth),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: app_measure.height10 * screenHeight,),

              for (var i = 0; i < 10; i++) ...[
                NoteCard(
                  deviceMedia: deviceMedia,
                  noteTitle: 'Note Title',
                  noteDetails: "To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:",
                  createdAt: '20/05/2023 10:03',
                  lastUpdatedAt: '20/05/2023 10:03',
                ),
      
                SizedBox(height: app_measure.height10 * screenHeight,)
              ]
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: app_strings.createNoteToolTip,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _incrementCounter() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateNote()),
    );
  }
}