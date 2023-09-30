import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import '../config/config.dart';
import 'controllers.dart';

class CRUDController extends BaseController {
  final String basePath;
  final String resourcePath;
  final Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer 1|hiGnP1SX3JQhj5hVoTMyXi3PxfsDXHabEzmCUVIR",
  };

  CRUDController({
    this.basePath = ApiEndpoint.api,
    required this.resourcePath,
  });

  Future<List<dynamic>> paginateList() async {
    try {
      var uri = Uri.parse(basePath + resourcePath);
      final response = await httpClient.get(uri, headers: headers);
      if (response.statusCode == HttpStatus.ok) {
        final responseData = jsonDecode(response.body);
        return responseData['data']['records'];
      }
    } catch (e) {
      // Handle the error as per your requirements.
      debugPrint("Error occurred while storing data: $e");
    }
    return [];
  }

  Future<List<dynamic>> list() async {
    try {
      var uri = Uri.parse(basePath + resourcePath);
      final response = await httpClient.get(uri, headers: headers);
      if (response.statusCode == HttpStatus.ok) {
        final responseData = jsonDecode(response.body);
        return responseData['data'];
      }
    } catch (e) {
      // Handle the error as per your requirements.
      debugPrint("Error occurred while storing data: $e");
    }
    return [];
  }

  Future<dynamic> store(obj) async {
    try {
      var uri = Uri.parse(basePath + resourcePath);
      final response =
          await httpClient.post(uri, body: jsonEncode(obj), headers: headers);
      if (response.statusCode == HttpStatus.ok) {
        final responseData = jsonDecode(response.body);
        return responseData['data'];
      }
      handleApiError({
        'statusCode': response.statusCode,
        'message': response.body,
      });
    } catch (error) {
      handleApiError(error);
    }
  }

  Future<dynamic> show(String id) async {
    try {
      var uri = Uri.parse("$basePath$resourcePath/$id");
      final response = await httpClient.get(uri, headers: headers);
      if (response.statusCode == HttpStatus.ok) {
        final responseData = jsonDecode(response.body);
        return responseData['data'];
      }
    } catch (e) {
      // Handle the error as per your requirements.
      debugPrint("Error occurred while storing data: $e");
    }
    return {};
  }

  Future<dynamic> update(String id, dynamic obj) async {
    try {
      var uri = Uri.parse("$basePath$resourcePath/$id");
      final response = await httpClient.put(uri, body: jsonEncode(obj), headers: headers);
      if (response.statusCode == HttpStatus.ok) {
        final responseData = jsonDecode(response.body);
        return responseData['data'];
      }
      handleApiError({
        'statusCode': response.statusCode,
        'message': response.body,
      });
    } catch (error) {
      handleApiError(error);
    }
  }

  Future<void> delete(String id) async {
    try {
      var uri = Uri.parse("$basePath$resourcePath/$id");
      final response = await httpClient.delete(uri, headers: headers);
      if (response.statusCode == HttpStatus.ok) {
        final responseData = jsonDecode(response.body);
        return responseData['data'];
      }
    } catch (e) {
      debugPrint("Something went wrong when deleting an item: $e");
    }
  }
}
