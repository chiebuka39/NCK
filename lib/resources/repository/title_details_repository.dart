import 'dart:async';

import 'package:nck/models/title_detail_model.dart';
import 'package:nck/resources/api/title_details_api.dart';


class TitleDetailsRepository {
  final titleApiProvider = TitleDetailsApi();
  Future<TitleDetailModel> fetchTitle(String id) => titleApiProvider.fetchTitleDetail(id);
}