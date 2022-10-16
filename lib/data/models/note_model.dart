class NoteModel {
  String? id;
  String? password;
  String? title;
  String? details;

  NoteModel({this.password, this.id, this.title, this.details});

  NoteModel.fromJson(Map<String,dynamic>json)
  {
    id = json['id'] as String;
    password = json['password'];
    title = json['title']as String;
    details = json['details']as String;
  }

  Map<String,dynamic> toMap()
  {
    return{
      'id':id,
      'password':password,
      'title':title,
      'details': details,
    };

  }
}
