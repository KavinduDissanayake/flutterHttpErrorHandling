import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/user_controller.dart';
import 'package:flutter_application_1/repository/jsonplaceholder_repository.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/screens/detaills_screen.dart';

class MainSccreen extends StatelessWidget {
  static const routeName = "/";

  var controller = UserController(Jsonplaceholder());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Http Error Hnadle"),
        ),
        body: FutureBuilder<List<User>>(
            future: controller.fetchUserList(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              //var userList = snapshot.data;
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    var user = snapshot.data?[index] as User;

                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context
                          , 
                          DetailSccreen.routeName,
                          arguments: user.id
                          );
                      },
                      child: ListTile(
                        leading: Text(user.id.toString()),
                        title: Text(user.name.toString()),
                        subtitle: Text(user.name.toString()),
                        trailing: Text(user.website.toString()),
                      ),
                    );
                  });
            }));
  }
}
