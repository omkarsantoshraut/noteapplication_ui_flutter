import 'package:flutter/material.dart';
import 'package:noteapplication_ui_flutter/pages/CreateNote.dart';

import 'package:noteapplication_ui_flutter/utils/constants/app_measurments.dart' as app_measure;
import 'package:noteapplication_ui_flutter/utils/widgets/noteCard.dart';

class NoteViewPage extends StatefulWidget {
  const NoteViewPage({
    super.key,
    required this.id,
    required this.title,
    required this.details,
    required this.createdAt,
    required this.lastUpdatedAt,
  });

  final String id;
  final String title;
  final String details;
  final String createdAt;
  final String lastUpdatedAt;

  @override
  State<NoteViewPage> createState() => _NoteViewPageState();
}

class _NoteViewPageState extends State<NoteViewPage> {

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
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: app_measure.height16 * screenWidth),
        child: Column(
          children: [
            SizedBox(height: app_measure.height10 * screenHeight,),

            Expanded(
              child: SingleChildScrollView(
                child: NoteCard(
                  deviceMedia: deviceMedia,
                  id: widget.id,
                  noteTitle: widget.title,
                  noteDetails: widget.details,
                  createdAt: widget.createdAt,
                  lastUpdatedAt: widget.lastUpdatedAt,
                  isEditing: false,
                ),
              ),
            ),
    
            SizedBox(height: app_measure.height10 * screenHeight,),

            Container(
              color: Colors.grey[200],
              child: Column(
                children: [
                  SizedBox(height: app_measure.height10 * screenHeight,),

                  Row(
                    children: [
                      SizedBox(width: app_measure.height40 * screenWidth,),

                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CreateNote(
                                  id: widget.id,
                                  title: widget.title,
                                  details: widget.details,
                                  createdAt: widget.createdAt,
                                )
                              ),
                            );
                          },
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.blue),
                          ),
                          child: Text('EDIT', style: TextStyle(fontSize: app_measure.height18 * screenHeight, fontWeight: FontWeight.w700, color: Colors.white),),
                        ),
                      ),

                      SizedBox(width: app_measure.height40 * screenWidth,),
                      SizedBox(width: app_measure.height40 * screenWidth,),

                      Expanded(
                        child: TextButton(
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.red),
                          ),
                          onPressed: () {
                            // Action for the second button
                          },
                          child: Text('DELETE', style: TextStyle(fontSize: app_measure.height18 * screenHeight, fontWeight: FontWeight.w700, color: Colors.white)),
                        ),
                      ),

                      SizedBox(width: app_measure.height40 * screenWidth,),
                    ],
                  ),

                  SizedBox(height: app_measure.height10 * screenHeight,),
                ],
              ),
            ),
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}