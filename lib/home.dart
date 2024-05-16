import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserData {
  final int postId;
  final int id;
  final String name;
  final String body;
  const UserData({
    required this.postId,
    required this.id,
    required this.name,
    required this.body,
  });
  factory UserData.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "postId": int postId,
        "id": int id,
        "name": String name,
        "body": String body,
      } =>
        UserData(
          postId: postId,
          id: id,
          name: name,
          body: body,
        ),
      _ => throw const FormatException('Failed to load UserData'),
    };
  }
}

// Future<UserData> fetchData() async {
//   final response = await http.get(
//     Uri.parse('https://jsonplaceholder.typicode.com/comments/1'),
//   );
//   if (response.statusCode == 200) {
//     return UserData.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//   } else {
//     throw Exception('Failed to parse UserData.');
//   }
// }

Future<List<UserData>> fetchData() async {
  var url = Uri.parse("https://jsonplaceholder.typicode.com/comments");
  final response =
      await http.get(url, headers: {"Content-Type": "application/json"});
  final List body = json.decode(response.body);
  if (response.statusCode == 200) {
    return body.map((e) => UserData.fromJson(e)).toList();
  } else {
    throw Exception('Failed to parse UserData.');
  }
}

class HomePage extends StatefulWidget {
  final List<String> items;

  const HomePage({super.key, required this.items});
  static const routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<UserData>> futureData;
  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.height * 0.05,
          child: IconButton(
            onPressed: () {},
            tooltip: 'Profile Picture',
            icon: Image(
              width: IconTheme.of(context).size,
              height: IconTheme.of(context).size,
              color: null,
              image: const AssetImage(
                'assets/images/gradiant2.png',
              ),
            ),
          ),
        ),
        title: const Text('Bubble'),
      ),
      body: FutureBuilder<List<UserData>>(
        future: futureData,
        builder: (ctx, ss) {
          if (ss.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (ss.hasData) {
            final posts = ss.data!;
            return buildData(posts);
          } else if (ss.hasError) {
            return Text(ss.error.toString());
          } else {
            return const Text("No data available.");
          }
        },
      ),
    );
  }

  Widget buildData(List<UserData> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (ctx, i) {
        final post = posts[i];
        return ListTile(
          leading: CircleAvatar(
            child: Text(
              post.postId.toString(),
            ),
          ),
          title: Text(
            post.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(post.body),
          trailing: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Text(post.id.toString()),
          ),
          isThreeLine: true,
          style: ListTileStyle.list,
        );
      },
    );
  }
}
