import 'package:flutter/material.dart';
import 'package:noteapplication_ui_flutter/data_models/all_notes.dart';
import 'package:noteapplication_ui_flutter/server_models/noteServerModel.dart';
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
      body: FutureBuilder<List<dynamic>>(
        future: fetchAllNotes(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While data is being fetched, show a loading view
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // If there's an error during data fetching, display an error message
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return WidgetWithData(screenWidth: screenWidth, screenHeight: screenHeight, notes: snapshot.data, deviceMedia: deviceMedia);
          }
        }
      ),
      // body: WidgetWithData(screenWidth: screenWidth, screenHeight: screenHeight, notes: notes, deviceMedia: deviceMedia),
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

class WidgetWithData extends StatelessWidget {
  const WidgetWithData({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.notes,
    required this.deviceMedia,
  });

  final double screenWidth;
  final double screenHeight;
  final List<dynamic>? notes;
  final MediaQueryData deviceMedia;

  @override
  Widget build(BuildContext context) {
    if (notes == null) {
      return const Center(child: Text('Something went wrong.'));
    }

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: app_measure.height16 * screenWidth),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: app_measure.height10 * screenHeight,),

            for (NoteServerModel note in notes!) ...[
              NoteCard(
                deviceMedia: deviceMedia,
                id: note.noteID ?? '',
                noteTitle: note.noteTitle,
                noteDetails: note.noteDetails,
                createdAt: note.createdAt ?? '',
                lastUpdatedAt: note.lastUpdatedAt ?? '',
              ),

              SizedBox(height: app_measure.height10 * screenHeight,)
            ]
          ],
        ),
      ),
    );
  }
}