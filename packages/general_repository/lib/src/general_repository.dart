// ignore_for_file: prefer_typing_uninitialized_variables
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:developer' as developer;
import 'package:authentication_repository/authentication_repository.dart';
import 'package:general_repository/general_repository.dart';
import 'package:http/http.dart' as http;
class GeneralRepository {
  GeneralRepository({
    this.authenticationRepository,
    http.Client? client,
  }) : _client = client ?? http.Client();
  final http.Client _client;
  final AuthenticationRepository? authenticationRepository;
  String? get token => authenticationRepository?.currentUser.token;
  Map<String, String>? addAuthorizationHeader(Map<String, String>? header) {
    header ??= {};
    if (token != null &&
        token!.isNotEmpty &&
        !header.containsKey('Authorization')) {
      header['Authorization'] = 'Bearer $token';
    }
    return header;
  }
  Future<dynamic> _handleRequest(
    Future<http.BaseResponse> Function() requestFunction,
    Map<String, String>? header,
    Duration finalTimeout,
    String handle, {
    bool enableLogs = true,
  }) async {
    if (enableLogs) {
      developer.log(
        'Request Header: ${jsonEncode(header)}',
        name: 'package.bloc_rest_api.$handle',
      );
    }
    late var rawResponse;
    var responseJson;
    try {
      rawResponse = await requestFunction().timeout(finalTimeout);
      if (rawResponse.statusCode == 401) {
        final newToken = await authenticationRepository?.refresh();
        header?.update("Authorization", (value) => "Bearer $newToken");
        rawResponse = await requestFunction().timeout(finalTimeout);
      }
      responseJson = await _response(rawResponse);
    } on SocketException {
      throw FetchDataException();
    } on TimeoutException {
      throw TimeOutExceptionC();
    } finally {
      if (enableLogs) {
        developer.log(
          'Request Response Status: ${rawResponse?.statusCode}',
          name: 'package.bloc_rest_api.$handle',
        );
        developer.log(
          'Request Raw Response: ${rawResponse is http.Response ? rawResponse.body : ''}',
          name: 'package.bloc_rest_api.$handle',
        );
      }
    }
    return responseJson;
  }
  Future<dynamic> get({
    required String handle,
    String? baseUrl,
    Map<String, String>? header,
    Duration? timeOut,
    bool enableLogs = true,
  }) async {
    header = addAuthorizationHeader(header);
    var uri = Uri.parse((baseUrl ?? ApiConfig.baseUrl) + handle);
    var finalTimeout = timeOut ?? ApiConfig.responseTimeOut;
    return _handleRequest(
      () => _client.get(uri, headers: header),
      header,
      finalTimeout,
      handle,
      enableLogs: enableLogs,
    );
  }
  Future<dynamic> post({
    required String handle,
    dynamic body,
    String? baseUrl,
    Map<String, String>? header,
    Duration? timeOut,
    bool enableLogs = true,
  }) async {
    header = addAuthorizationHeader(header);
    var uri = Uri.parse((baseUrl ?? ApiConfig.baseUrl) + handle);
    var finalTimeout = timeOut ?? ApiConfig.responseTimeOut;
    if (enableLogs) {
      developer.log(
        'Request Body: $body',
        name: 'package.bloc_rest_api.$handle',
      );
    }
    return _handleRequest(
      () => _client.post(uri, body: body, headers: header),
      header,
      finalTimeout,
      handle,
      enableLogs: enableLogs,
    );
  }
  Future<dynamic> put({
    required String handle,
    dynamic body,
    String? baseUrl,
    Map<String, String>? header,
    Duration? timeOut,
    bool enableLogs = true,
  }) async {
    header = addAuthorizationHeader(header);
    var uri = Uri.parse((baseUrl ?? ApiConfig.baseUrl) + handle);
    var finalTimeout = timeOut ?? ApiConfig.responseTimeOut;
    return _handleRequest(
      () => _client.put(uri, body: body, headers: header),
      header,
      finalTimeout,
      handle,
      enableLogs: enableLogs,
    );
  }
  Future<dynamic> patch({
    required String handle,
    dynamic body,
    String? baseUrl,
    Map<String, String>? header,
    Duration? timeOut,
    bool enableLogs = true,
  }) async {
    header = addAuthorizationHeader(header);
    var uri = Uri.parse((baseUrl ?? ApiConfig.baseUrl) + handle);
    var finalTimeout = timeOut ?? ApiConfig.responseTimeOut;
    return _handleRequest(
      () => _client.patch(uri, body: body, headers: header),
      header,
      finalTimeout,
      handle,
      enableLogs: enableLogs,
    );
  }
  Future<dynamic> delete({
    required String handle,
    String? baseUrl,
    Map<String, String>? header,
    Duration? timeOut,
    bool enableLogs = true,
  }) async {
    header = addAuthorizationHeader(header);
    var uri = Uri.parse((baseUrl ?? ApiConfig.baseUrl) + handle);
    var finalTimeout = timeOut ?? ApiConfig.responseTimeOut;
    return _handleRequest(
      () => _client.delete(uri, headers: header),
      header,
      finalTimeout,
      handle,
      enableLogs: enableLogs,
    );
  }
  Future<dynamic> multipartPost({
    required String handle,
    Map<String, String>? fields,
    List<Map<String, dynamic>>? files,
    String? baseUrl,
    Map<String, String>? header,
    Duration? timeOut,
    bool enableLogs = true,
  }) async {
    header = addAuthorizationHeader(header);
    var uri = Uri.parse((baseUrl ?? ApiConfig.baseUrl) + handle);
    var finalTimeout = timeOut ?? ApiConfig.responseTimeOut;
    if (enableLogs) {
      developer.log(
        'Multipart Request Fields: $fields',
        name: 'package.bloc_rest_api.$handle',
      );
      developer.log(
        'Multipart Request Files: $files',
        name: 'package.bloc_rest_api.$handle',
      );
    }
    var request = _buildMultipartRequest(uri, fields, files, header);
    return _handleRequest(
      () async => await _client.send(request),
      header,
      finalTimeout,
      handle,
      enableLogs: enableLogs,
    );
  }
  http.MultipartRequest _buildMultipartRequest(
    Uri uri,
    Map<String, String>? fields,
    List<Map<String, dynamic>>? files,
    Map<String, String>? header,
  ) {
    var request = http.MultipartRequest('POST', uri)
      ..fields.addAll(fields ?? {})
      ..headers.addAll(header ?? {});
    if (files != null) {
      for (var file in files) {
        var multipartFile = http.MultipartFile.fromBytes(
          file['fieldName']!,
          file['fileBytes'] as List<int>,
          filename: file['fileName']!,
        );
        request.files.add(multipartFile);
      }
    }
    return request;
  }
  Future<dynamic> _response(http.BaseResponse response) async {
    if (response is http.StreamedResponse) {
      var res = await http.Response.fromStream(response);
      return _response(res);
    }
    switch ((response as http.Response).statusCode) {
      case 200:
      case 201:
        return json.decode(response.body.toString());
      case 404:
        authenticationRepository?.logout();
        throw jsonDecode(response.body)["message"].toString();
      case 400:
      case 401:
      case 403:
      case 422:
        throw jsonDecode(response.body)["message"].toString();
      case 500:
      default:
        throw FetchDataException(
          'Something went wrong, please try again later.\n\nStatus Code : ${response.statusCode}',
        );
    }
  }
}






