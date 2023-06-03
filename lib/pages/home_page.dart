import 'package:flutter/material.dart';
import 'package:noteapplication_ui_flutter/data_models/all_notes.dart';

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

  List<dynamic> notes = [];

  Future<void> fetchData() async {
    var data = await fetchAllNotes();
    setState(() {
      notes = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    fetchData();
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
        title: const Text(app_strings.appHeaderName),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: app_measure.height16 * screenWidth),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: app_measure.height10 * screenHeight,),

              for (var note in notes) ...[
                NoteCard(
                  deviceMedia: deviceMedia,
                  id: note['_id'],
                  noteTitle: note['title'],
                  noteDetails: note['details'],
                  createdAt: note['createdAt'],
                  lastUpdatedAt: note['lastUpdatedAt'],
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