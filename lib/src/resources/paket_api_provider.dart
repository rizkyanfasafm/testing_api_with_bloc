import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/paket_model.dart';

class PaketApiProvider{
  Client client = Client();

  Future<ListPaket> fetchPaketList() async{
    final response = await client.get('http://192.168.100.21:8000/api/paket');
    // print(response.body);
    if(response.statusCode == 200){
      return ListPaket.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load post');
    }
  }
}