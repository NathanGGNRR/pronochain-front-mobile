import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:pronochain/model/user.dart';

Future<List<User>> getUsersInfo() async {
   String token =dotenv.env['TOKEN'].toString();
  final response = await http.get(
    Uri.parse(dotenv.env['BACK_URL'].toString() +
        'users?includes=user.friends,user.friend_requests'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    List<User> users;
    users = (json.decode(response.body)['data'] as List)
        .map((i) => User.fromJson(i))
        .toList();
    return users;
  } else {
    throw Exception('Failed to load users');
  }
}

Future<http.Response> replyInvitation(int userId, int requestingUserId, String status) {
  String token =dotenv.env['TOKEN'].toString();

  return http.patch(
    Uri.parse(dotenv.env['BACK_URL'].toString() + 'users/$userId/friends'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(<String, String>{
      'requesting_user_id': requestingUserId.toString(),
      'status': status
    }),
  );
}

Future<http.Response> sendInviation(int userId, int requestedUserId) {
   String token =dotenv.env['TOKEN'].toString();

  return http.post(
    Uri.parse(dotenv.env['BACK_URL'].toString() + 'users/$userId/friends'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(<String, String>{
      'requested_user_id': requestedUserId.toString(),
    }),
  );
}


Future<List<User>> searchUser(String username) async {
   String token =dotenv.env['TOKEN'].toString();
  final response = await http.get(
    Uri.parse(dotenv.env['BACK_URL'].toString() +
        'users?username=$username'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    List<User> users;
    users = (json.decode(response.body)['data'] as List)
        .map((i) => User.fromJson(i))
        .toList();
        print(users);
    return users;
  } else {
    throw Exception('Failed to load users');
  }
}