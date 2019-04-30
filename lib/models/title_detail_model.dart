class TitleDetailModel {

  int _id;
  String _title;
  String _description;
  String _image;
  String _createdAt;
  String _updatedAt;

  

  TitleDetailModel.fromJson(Map<String, dynamic> parsedJson) {
    
    
    _id =parsedJson['id'];
    _title =parsedJson['title'];
    _description =parsedJson['description'];
    _image =parsedJson['image'];
    _createdAt =parsedJson['created_at'];
    _updatedAt =parsedJson['updated_at'];
  }

   int get id => _id;
   String get title => _title;
   String get description => _description;
   String get image => _image;
   String get createdAt => _createdAt;
   String get updatedAt => _updatedAt;
}