import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as devtools;

import 'models/Album.dart';

class SerViceCall extends StatefulWidget {
  const SerViceCall({Key? key}) : super(key: key);

  @override
  State<SerViceCall> createState() => _SerViceCallState();
}

class _SerViceCallState extends State<SerViceCall> {
  late Future<List<Album>> futureAlbum;
  List<Album> albumList = [];
  Future<bool>? data_arrived;
  // ignore: prefer_typing_uninitialized_variables
  var ff;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    futureAlbum.then((e) {
      ff = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Album>>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 700,
                    child: ListView.builder(
                      itemCount: albumList.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: ListTile(
                          title: Text("userID:" +
                              ff[index].userId.toString() +
                              "----id: " +
                              ff[index].id.toString() +
                              "----title: " +
                              ff[index].title.toString()),
                        ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }

  Future<List<Album>> fetchAlbum() async {
    List<Album> tempData = [];
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final first_json = jsonDecode(response.body);
      devtools.log(first_json.toString());
      for (var i = 0; i < first_json.length; i++) {
        var album = Album.fromJson(first_json[i]);
        tempData.add(album);
      }
      setState(() {
        albumList = tempData;
      });
      return tempData;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
