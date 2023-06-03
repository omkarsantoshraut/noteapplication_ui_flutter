import 'package:flutter/material.dart';
import 'package:noteapplication_ui_flutter/data_models/delete_note.dart';
import 'package:noteapplication_ui_flutter/pages/CreateNote.dart';
import 'package:noteapplication_ui_flutter/pages/home_page.dart';
import 'package:noteapplication_ui_flutter/pages/note_view_page.dart';

import 'package:noteapplication_ui_flutter/utils/constants/app_measurments.dart' as app_measure;
import 'package:noteapplication_ui_flutter/utils/constants/app_strings.dart' as app_strings;

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.deviceMedia,
    required this.id,
    required this.noteTitle,
    required this.noteDetails,
    required this.createdAt,
    required this.lastUpdatedAt,
    this.isEditing = true,
  });

  final MediaQueryData deviceMedia;
  final String id;
  final String noteTitle;
  final String noteDetails;
  final String createdAt;
  final String lastUpdatedAt;
  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    // Accessing MediaQuery for responsive layout
    // Calculate the height and width of the screen.
    final double screenHeight = deviceMedia.size.height - deviceMedia.padding.top - deviceMedia.padding.bottom;
    final double screenWidth = deviceMedia.size.width - deviceMedia.padding.left - deviceMedia.padding.right;

    if (isEditing) {
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NoteViewPage(
              id: id,
              title: noteTitle,
              details: noteDetails,
              createdAt: createdAt,
              lastUpdatedAt: lastUpdatedAt,
            )),
          );
        },
        child: Card(
          margin: const EdgeInsets.all(0),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: app_measure.height10 * screenHeight, horizontal: app_measure.height15 * screenWidth),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  noteTitle,
                  style: TextStyle(
                    fontSize: app_measure.height24 * screenHeight,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                
                SizedBox(height: app_measure.height10 * screenHeight,),
      
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: app_measure.height18 * screenHeight,
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                    ),
                    text: noteDetails,
                  ),
                ),
      
                SizedBox(height: app_measure.height10 * screenHeight,),
      
                Row(
                  children: [
                    Text(
                      app_strings.createdAt,
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        fontSize: app_measure.height16 * screenHeight,
                      ),
                    ),
      
                    Text(
                      createdAt,
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: app_measure.height14 * screenHeight,
                      ),
                    )
                  ],
                ),
      
                SizedBox(height: app_measure.height5 * screenHeight,),
      
                Row(
                  children: [
                    Text(
                      app_strings.lastUpdatedAt,
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        fontSize: app_measure.height16 * screenHeight,
                      ),
                    ),
      
                    Text(
                      lastUpdatedAt,
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: app_measure.height14 * screenHeight,
                      ),
                    )
                  ],
                ),
      
                ButtonBar(
                  overflowButtonSpacing: 0.0,
                  buttonPadding: EdgeInsets.all(0),
                  children: <Widget>[
                    TextButton(
                      child: Text('EDIT'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CreateNote(
                              id: id,
                              title: noteTitle,
                              details: noteDetails,
                              createdAt: createdAt,
                            )
                          ),
                        );
                      },
                    ),
                    TextButton(
                      child: const Text('DELETE'),
                      onPressed: () {
                        deleteNoteWithID(id);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MyHomePage()
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
    
    return Card(
      margin: const EdgeInsets.all(0),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: app_measure.height10 * screenHeight, horizontal: app_measure.height15 * screenWidth),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: app_measure.height10 * screenHeight,),
    
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: app_measure.height18 * screenHeight,
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                ),
                text: noteDetails,
              ),
            ),
    
            SizedBox(height: app_measure.height10 * screenHeight,),
    
            Row(
              children: [
                Text(
                  app_strings.createdAt,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                    fontSize: app_measure.height16 * screenHeight,
                  ),
                ),
    
                Text(
                  createdAt,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: app_measure.height14 * screenHeight,
                  ),
                )
              ],
            ),
    
            SizedBox(height: app_measure.height5 * screenHeight,),
    
            Row(
              children: [
                Text(
                  app_strings.lastUpdatedAt,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                    fontSize: app_measure.height16 * screenHeight,
                  ),
                ),
    
                Text(
                  lastUpdatedAt,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: app_measure.height14 * screenHeight,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}