import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/album_contoller.dart';
import 'package:flutter_application_1/models/album.dart';
import 'package:flutter_application_1/repository/jsonplaceholder_repository.dart';

class DetailSccreen extends StatelessWidget {
  static const routeName = "/details";

  var cotroller = AlbumController(Jsonplaceholder());

  @override
  Widget build(BuildContext context) {
    //get userID
    final userId = ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: Text("Http Error Hnadle"),
      ),
      body: FutureBuilder<List<Album>>(
          future: cotroller.fetchAlbum(userId),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Container(
                  padding: const EdgeInsets.all(40),
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.orange[100],
                  ),
                  child: Text('${snapshot.error.toString()}'),
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            var albmus = snapshot.data!;
            return GridView.builder(
              itemCount: albmus.length,
              padding: const EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 1),
                itemBuilder: (context, index) {
                  return Container( 
                    child: Image.network('https://picsum.photos/id/${albmus[index].id}/200/300')
                  );
                });
          }),
    );
  }
}
