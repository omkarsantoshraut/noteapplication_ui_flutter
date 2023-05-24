import 'package:flutter/material.dart';
import 'package:noteapplication_ui_flutter/pages/CreateNote.dart';

import 'package:noteapplication_ui_flutter/utils/constants/app_measurments.dart' as app_measure;
import 'package:noteapplication_ui_flutter/utils/constants/app_strings.dart' as app_strings;

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.deviceMedia,
    required this.noteTitle,
    required this.noteDetails,
    required this.createdAt,
    required this.lastUpdatedAt,
    this.isEditing = true,
  });

  final MediaQueryData deviceMedia;
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
            MaterialPageRoute(builder: (context) => const NoteViewPage(
              id: 'id123',
              title: 'Note Title',
              details: "To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:",
              createdAt: '20/05/2023 10:03',
              lastUpdatedAt: '20/05/2023 10:03',
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
                              id: 'id1234',
                              title: 'Demo Note',
                              details: "To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:",
                            )
                          ),
                        );
                      },
                    ),
                    TextButton(
                      child: const Text('DELETE'),
                      onPressed: () {},
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
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: app_measure.height10 * screenHeight,),

            Expanded(
              child: SingleChildScrollView(
                child: NoteCard(
                  deviceMedia: deviceMedia,
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
                                  id: 'id1234',
                                  title: 'Demo Note',
                                  details: "To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:To show formatted text in Flutter, you can use the RichText widget along with various text styling widgets such as TextSpan and TextStyle. Here's an example of how you can display formatted text:",
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