class ListPaket{
  List<Paket> _listPaket = [];

  ListPaket.fromJson(Map<String,dynamic> parsedJSON){
    List<Paket> temp = [];
    for(int i = 0; i < parsedJSON['pakets'].length; i++){
      Paket paket = Paket(parsedJSON['pakets'][i]);
      temp.add(paket);
    }
    _listPaket = temp;
  }

  List<Paket> get listPaket => _listPaket;
}

class Paket{
  int _id;
  String _nama;
  int _nominal;
  int _jumlahPeriodeBayar;
  int _slot;
  List<_Slot> _paketSlot = [];

  Paket(paket){
    _id = paket['id'];
    _nama = paket['nama'];
    _nominal = paket['nominal'];
    _jumlahPeriodeBayar = paket['jumlah_periode_bayar'];
    _slot = paket['slot'];
    List<_Slot> temp = [];
    for(int i = 0; i < paket['paketslot'].length; i++){
      _Slot slot = _Slot(paket['paketslot'][i]);
      temp.add(slot);
    }
    _paketSlot = temp;
  }

  int get id => _id;
  String get nama => _nama;
  int get nominal => _nominal;
  int get jumlahPeriodeBayar => _jumlahPeriodeBayar;
  int get slot => _slot;
  List<_Slot> get paketSlot => _paketSlot;
}

class _Slot{
  int _id;
  int _slotNomor;
  int _pasok;

  _Slot(slot){
    _id = slot['id'];
    _slotNomor = slot['slot_nomor'];
    _pasok = slot['pasok'];
  }

  int get id => _id;
  int get slotNomor => _slotNomor;
  int get pasok => _pasok;
}