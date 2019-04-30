import 'dart:async';

import 'package:nck/models/title_model.dart';
import 'package:nck/resources/api/title_api.dart';



class TitlesRepository {
  final titleApiProvider = TitleApi();

  Future<Titles> fetchAllTitles() => titleApiProvider.fetchTitleList();
}