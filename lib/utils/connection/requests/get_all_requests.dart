import 'dart:convert';
import 'package:deprem_app/constants/app_constants.dart';
import 'package:deprem_app/constants/connection_status_codes.dart';
import 'package:deprem_app/models/deprem_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RequestFunctions {
  Future<List<Deprem>> getAllEartquakes(BuildContext context) async {
    var response = await http.get(Uri.parse(AppConstants.getAllEartquakeApi));
    if (response.statusCode ==
        ConnectionStatusCodes().succesfullConnectionStatusCode) {
      return (json.decode(response.body) as List)
          .map((e) => (Deprem.fromJson(e)))
          .toList();
    } else if (response.statusCode ==
        ConnectionStatuses.wrongAccessStatusCode.connectionStatusCodes()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: ConnectionStatuses.wrongAccessStatusCode
              .connectionStatusWidgets()));
      throw Exception('Failed to load post');
    } else {
      throw Exception('Failed to load post');
    }
  }
}
