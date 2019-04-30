class Titles {
  List<TitleModel> _usersmodel = [];

  Titles.fromJson(List<dynamic> parsedJson) {
    _usersmodel = (parsedJson)
          .map((data) => new TitleModel.fromJson(data))
          .toList();
  }

  List<TitleModel> get usersModel => _usersmodel;
}


class TitleModel {

  int _id;
  String _title;
  String _description;
  String _image;
  String _createdAt;
  String _updatedAt;

  

  TitleModel.fromJson(Map<String, dynamic> parsedJson) {
    
    
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