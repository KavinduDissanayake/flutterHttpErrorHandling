import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/album.dart';
import 'package:flutter_application_1/models/user.dart';

abstract class Repository {

  Future<List<User>> getUsers();

  Future<List<Album>> getAlbums(int userId);

}
