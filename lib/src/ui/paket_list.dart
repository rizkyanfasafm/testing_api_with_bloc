import 'package:flutter/material.dart';
import '../models/paket_model.dart';
import '../blocs/paket_bloc.dart';

class PaketList extends StatefulWidget {
  @override
  _PaketListState createState() => _PaketListState();
}

class _PaketListState extends State<PaketList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllPaket();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Paket'),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<ListPaket> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.hasError.toString());
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ListPaket> snapshot) {
    // return GridView.builder(
    //     itemCount: snapshot.data.results.length,
    //     gridDelegate:
    //         SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    //     itemBuilder: (BuildContext context, int index) {
    //       // return Image.network(
    //       //   'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}',
    //       //   fit: BoxFit.cover,
    //       // );
    //       return GridTile(
    //         child: InkResponse(
    //           enableFeedback: true,
    //           child: Image.network(
    //             'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}',
    //             fit: BoxFit.cover,
    //           ),
    //           onTap: () => openDetailPage(snapshot.data, index),
    //         ),
    //       );
    //     });
    return ListView.builder(
        itemCount: snapshot.data.listPaket.length,
        itemBuilder: (context, i) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailPaket(snapshot.data.listPaket[i], snapshot.data.listPaket[i].nominal)));
              // MaterialPageRoute(builder: (context) => SecondRoute()),
            },
            title: Text('Nama Paket : ${snapshot.data.listPaket[i].nama}'),
          );
        });
  }
}

class DetailPaket extends StatefulWidget {
  final Paket paket;
  final int nominal;
  DetailPaket(this.paket, this.nominal);

  @override
  _DetailPaketState createState() => _DetailPaketState();
}

class _DetailPaketState extends State<DetailPaket> {
  List<TextEditingController> lists = [];
  @override
  void initState() {
    lists = List.generate(widget.paket.paketSlot.length, (index) => TextEditingController());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Paket'),
      ),
      // body: ListView.builder(
      //     itemCount: widget.paket.paketSlot.length,
      //     itemBuilder: (context, i) {
      //       return ListTile(
      //         title: Text(
      //             'Slot ${widget.paket.paketSlot[i].slotNomor} wajib membayar sebesar ${widget.paket.paketSlot[i].pasok}'),
      //       );
      //     }),
      body: Column(
        children: [
          for(int i = 0; i < widget.paket.paketSlot.length; i++){
            TextField(
              controller: lists[i],
            )
          }
        ],
      ),
    );
  }
}
