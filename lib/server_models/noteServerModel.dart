
class NoteServerModel {
  final String? noteID;
  final String noteTitle;
  final String noteDetails;
  final String? createdAt;
  final String? lastUpdatedAt;

  NoteServerModel({
    this.noteID,
    required this.noteTitle,
    required this.noteDetails,
    this.createdAt,
    this.lastUpdatedAt,
  });

  factory NoteServerModel.noteDataFromJSON(Map<String, dynamic> json) {
    return NoteServerModel(
      noteID: json['_id'],
      noteTitle: json['title'],
      noteDetails: json['details'],
      createdAt: json['createdAt'],
      lastUpdatedAt: json['lastUpdatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': noteID,
      'title': noteTitle,
      'details': noteDetails,
      'createdAt': createdAt,
      'lastUpdatedAt': lastUpdatedAt,
    };
  }

  Map<String, dynamic> toJsonForUpdateNote() {
    return {
      'title': noteTitle,
      'details': noteDetails,
      'createdAt': createdAt,
    };
  }
}