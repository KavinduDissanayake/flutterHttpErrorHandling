import 'package:flutter_application_1/models/album.dart';
import 'package:flutter_application_1/repository/repository.dart';

class AlbumController {
  final Repository _repository;
  AlbumController(this._repository);


  Future<List<Album>> fetchAlbum(int userId) async{
    return _repository.getAlbums(userId);
  }
}
