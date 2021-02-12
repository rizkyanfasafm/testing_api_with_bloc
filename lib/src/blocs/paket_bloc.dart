import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/paket_model.dart';

class PaketBloc{
  final _repository = Repository();
  final _paketFetcher = PublishSubject<ListPaket>();

  Stream<ListPaket> get allMovies => _paketFetcher.stream;
  fetchAllPaket() async{
    ListPaket listPaket = await _repository.fetchPaket();
    _paketFetcher.sink.add(listPaket);
  }

  dispose(){
    _paketFetcher.close();
  }
}

final bloc = PaketBloc();