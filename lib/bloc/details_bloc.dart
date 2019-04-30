import 'package:nck/models/title_detail_model.dart';
import 'package:nck/resources/repository/title_details_repository.dart';
import 'package:rxdart/rxdart.dart';

class TitleDetailBloc {
  final _repository = TitleDetailsRepository();
  final _titlesFetcher = PublishSubject<TitleDetailModel>();
  

  Observable<TitleDetailModel> get allTitles => _titlesFetcher.stream;

  fetchTitle(String id) async {
    TitleDetailModel itemModel = await _repository.fetchTitle(id);
    _titlesFetcher.sink.add(itemModel);
  }


  dispose() {
    _titlesFetcher.close();
  }
}

final detailsBloc = TitleDetailBloc();