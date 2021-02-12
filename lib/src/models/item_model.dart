class ItemModel{
  int _page;
  int _totalResults;
  int _totalPages;
  List<_Result> _results = [];

  ItemModel.fromJson(Map<String, dynamic> parsedJson){
    _page = parsedJson['page'];
    _totalResults = parsedJson['total_results'];
    _totalPages = parsedJson['total_pages'];
    List<_Result> temp = [];
    for(int i = 0; i < parsedJson['results'].length; i++){
      _Result result = _Result(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }
  int get page => _page;
  int get totalResults => _totalResults;
  int get totalPages => _totalPages;
  List<_Result> get results => _results;
}

class _Result{
  bool _adult;
  String _backdropPath;
  List<int> _genreIds = [];
  int _id;
  String _originalLanguage;
  String _originalTitle;
  String _overview;
  double _popularity;
  String _posterPath;
  String _releaseDate;
  String _title;
  bool _video;
  double _voteAverage;
  int _voteCount;

  _Result(result){
    _adult = result['adult'];
    _backdropPath = result['backdrop_path'];
    for(int i = 0; i < result['genre_ids'].length; i++){
      _genreIds.add(result['genre_ids'][i]);
    }
    _id = result['id'];
    _originalLanguage = result['original_language'];
    _originalTitle = result['original_title'];
    _overview = result['overview'];
    _popularity = result['popularity'];
    _posterPath = result['poster_path'];
    _releaseDate = result['release_date'];
    _title = result['title'];
    _video = result['video'];
    _voteAverage = result['popularity'];
    _voteCount = result['vote_count'];
  }

  bool get adult => _adult;
  String get backdropPath => _backdropPath;
  List<int> get genreIds => _genreIds;
  int get id => _id;
  String get originalLanguage => _originalLanguage;
  String get originalTitle => _originalTitle;
  String get overview => _overview;
  double get popularity => _popularity;
  String get posterPath => _posterPath;
  String get releaseDate => _releaseDate;
  String get title => _title;
  bool get video => _video;
  double get voteAverage => _voteAverage;
  int get voteCount => _voteCount;
}