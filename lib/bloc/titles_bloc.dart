import 'package:nck/models/title_model.dart';
import 'package:nck/resources/repository/title_repository.dart';
import 'package:rxdart/rxdart.dart';

class TitleBloc {
  final _repository = TitlesRepository();
  final _titlesFetcher = PublishSubject<Titles>();
  

  Observable<Titles> get allTitles => _titlesFetcher.stream;

  fetchAllTitles() async {
    Titles itemModel = await _repository.fetchAllTitles();
    _titlesFetcher.sink.add(itemModel);
  }


  dispose() {
    _titlesFetcher.close();
  }
}

final bloc = TitleBloc();