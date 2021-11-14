import 'dart:convert';
import 'dart:io';

import 'package:flutter_application_1/models/album.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/unility/http_exception.dart';

class Jsonplaceholder extends Repository {
//mkae http
  String baseURl = 'https://jsonplaceholder.typicode.com';

//http error handling
  dynamic _response(http.Response response) {
    print(response.request?.url);

    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetachDataException(
            'Error occured while Communcation with Server with Status Code: ${response.statusCode} ');
    }
  }

  @override
  Future<List<User>> getUsers() async {
    //retrun type JsonArray
    List<User> userList = [];

    var url = Uri.parse('$baseURl/users');

    try {
      var response = await http.get(url);
      var responseJson = _response(response);

      for (var i = 0; i < responseJson.length; i++) {
        userList.add(User.fromJson(responseJson[i]));
      }
    } on SocketException catch (e) {
      throw FetachDataException("No Internet Connection ");
    }
    return userList;
  }

  @override
  Future<List<Album>> getAlbums(int userId) async {
    var url = Uri.parse('$baseURl/albums?userId=$userId');

    // List<Album> albumsList = [];

    try {
      var response = await http.get(url,
          headers: {HttpHeaders.authorizationHeader: "your_api_token_here"});

      var responseJosn = _response(response) as List;

      return responseJosn.map((e) => Album.fromJson(e)).toList();


    } on SocketException {
      throw FetachDataException("No Internet Connection ");
    }

    //return albumsList;
  }
}
