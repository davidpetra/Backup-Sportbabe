import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;
import 'package:flutter/cupertino.dart';

class Users {
  final String id;
  final String email;
  final String nama;
  final String phone;
  final String registeredAt;

  Users({this.id, this.email, this.nama, this.phone, this.registeredAt});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        id: json['id'],
        email: json['email'],
        nama: json['nama'],
        phone: json['phone'],
        registeredAt: json['registered_at']
    );
  }

// INI BUAT POST USERS (parse text ke json ini)
//  Map<String, dynamic> toJson() {
//    return {
//      'id': id,
//      'email': email,
//      'nama': nama,
//      'phone': phone,
//      'registered_at': registeredAt
//    };
//  }

  @override
  String toString() {
    return 'Users{id: $id, email: $email, nama: $nama, phone: $phone, registered_at: $registeredAt}';
  }
}

List<Users> parseUsers(String responseBody) {
  final parsed = json.decode(responseBody);
  final rest = parsed['results'] as List;
  print(rest);
  return rest.map<Users>((json) => Users.fromJson(json)).toList();
}

//String usersToJson(Users data) {
//  final jsonData = data.toJson();
//  return json.encode(jsonData);
//}

class ApiService {
  final String baseURL = 'https://sportbabe-api.herokuapp.com';
  Client client = Client();

  Future<List<Users>> getUsers() async {
    final response = await client.get('$baseURL/users');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return parseUsers(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Users!');
    }
  }
}

class restAPI extends StatefulWidget {
  @override
  _restAPIState createState() => _restAPIState();
}

class _restAPIState extends State<restAPI> {
  ApiService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: apiService.getUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<Users>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  'Something wrong with message: ${snapshot.error.toString()}'),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<Users> users = snapshot.data;
            return _buildListView(users);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildListView(List<Users> users) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.builder(itemBuilder: (context, index) {
        Users user = users[index];
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    user.nama,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline6,
                  ),
                  Text(user.id),
                  Text(user.email),
                  Text(user.phone)
                ],
              ),
            ),
          ),
        );
      },
        itemCount: users.length,
      ),
    );
  }
}