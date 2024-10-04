// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:developer' as developer;

import 'package:authentication_repository/authentication_repository.dart';
import 'package:general_repository/general_repository.dart';
import 'package:http/http.dart' as http;

/// General Repository to interact with any REST API
class GeneralRepository {
  GeneralRepository({
    this.authenticationRepository,
    http.Client? client,
  }) : _client = client ?? http.Client();

  final http.Client _client;
  final AuthenticationRepository? authenticationRepository;

  String? get token => authenticationRepository?.currentUser.token;

  /// Used to initiate a [GET] request
  ///
  /// The [handle] is end point that will be attached to the [baseUrl]
  /// which either can be provided as a whole using the [ApiConfig]
  /// setting or can be overidden as it is given as an option parameter
  /// in the function.
  ///
  /// Same thing applies for the [header] parameter
  Future<dynamic> get({
    required String handle,
    String? baseUrl,
    Map<String, String>? header,
    Duration? timeOut,
    bool enableLogs = false,
  }) async {
    // final url to which call will be made
    var url = (baseUrl ?? ApiConfig.baseUrl) + handle;

    // uri to be passed to request
    var uri = Uri.parse(url);

    // final timeout to be used with request
    var finalTimeout = timeOut ?? ApiConfig.responseTimeOut;

    if (enableLogs) {
      developer.log(
        'Request URl: $url',
        name: 'package.bloc_rest_api.$handle',
      );
      developer.log(
        'Request Header: ${jsonEncode(header)}',
        name: 'package.bloc_rest_api.$handle',
      );
    }

    late var rawResponse;
    var responseJson;
    try {
      rawResponse = await _client
          .get(
            uri,
            headers: header,
          )
          .timeout(finalTimeout);
      if (rawResponse?.statusCode == 401) {
        await authenticationRepository?.refresh();
        if (header?.containsKey("Authorization") == true) {
          header?.update("Authorization", (value) => "Bearer $token");
        }
        rawResponse = await _client
            .get(
              uri,
              headers: header,
            )
            .timeout(finalTimeout);
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
          'Request Raw Response: ${rawResponse.body}',
          name: 'package.bloc_rest_api.$handle',
        );
      }
    }
    return responseJson;
  }

  /// Used to initiate a [DELETE] request
  ///
  /// The [handle] is end point that will be attached to the [baseUrl]
  /// which either can be provided as a whole using the [ApiConfig]
  /// setting or can be overidden as it is given as an option parameter
  /// in the function.
  ///
  /// Same thing applies for the [header] parameter
  Future<dynamic> delete({
    required String handle,
    String? baseUrl,
    Map<String, String>? header,
    Duration? timeOut,
    bool enableLogs = false,
  }) async {
    // final url to which call will be made
    var url = (baseUrl ?? ApiConfig.baseUrl) + handle;

    // uri to be passed to request
    var uri = Uri.parse(url);

    // final timeout to be used with request
    var finalTimeout = timeOut ?? ApiConfig.responseTimeOut;

    if (enableLogs) {
      developer.log(
        'Request URl: $url',
        name: 'package.bloc_rest_api.$handle',
      );
      developer.log(
        'Request Header: ${jsonEncode(header)}',
        name: 'package.bloc_rest_api.$handle',
      );
    }

    late var rawResponse;
    var responseJson;
    try {
      rawResponse = await _client
          .delete(
            uri,
            headers: header,
          )
          .timeout(finalTimeout);
      if (rawResponse?.statusCode == 401) {
        await authenticationRepository?.refresh();
        if (header?.containsKey("Authorization") == true) {
          header?.update("Authorization", (value) => "Bearer $token");
        }
        rawResponse = await _client
            .delete(
              uri,
              headers: header,
            )
            .timeout(finalTimeout);
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
          'Request Raw Response: ${rawResponse.body}',
          name: 'package.bloc_rest_api.$handle',
        );
      }
    }
    return responseJson;
  }

  /// Used to initiate a [POST] request
  ///
  /// Use the [body] parameter to send the json data to the service
  ///
  /// The [handle] is end point that will be attached to the [baseUrl]
  /// which either can be provided as a whole using the [ApiConfig]
  /// setting or can be overidden as it is given as an option parameter
  /// in the function.
  ///
  /// Same thing applies for the [header] parameter
  Future<dynamic> post({
    required String handle,
    dynamic body,
    String? baseUrl,
    Map<String, String>? header,
    Duration? timeOut,
    bool enableLogs = false,
  }) async {
    // final url to which call will be made
    var url = (baseUrl ?? ApiConfig.baseUrl) + handle;

    // uri to be passed to request
    var uri = Uri.parse(url);

    // final timeout to be used with request
    var finalTimeout = timeOut ?? ApiConfig.responseTimeOut;

    if (enableLogs) {
      developer.log(
        'Request URl: $url',
        name: 'package.bloc_rest_api.$handle',
      );
      developer.log(
        'Request Header: ${jsonEncode(header)}',
        name: 'package.bloc_rest_api.$handle',
      );
      developer.log(
        'Request Body: $body',
        name: 'package.bloc_rest_api.$handle',
      );
    }
    var rawResponse;
    var responseJson;
    try {
      rawResponse = await _client
          .post(
            uri,
            body: body,
            headers: header,
          )
          .timeout(finalTimeout);
      if (rawResponse?.statusCode == 401) {
        await authenticationRepository?.refresh();
        if (header?.containsKey("Authorization") == true) {
          header?.update("Authorization", (value) => "Bearer $token");
        }
        rawResponse = await _client
            .post(
              uri,
              body: body,
              headers: header,
            )
            .timeout(finalTimeout);
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
          'Request Raw Response: $responseJson',
          name: 'package.bloc_rest_api.$handle',
        );
      }
    }
    return responseJson;
  }

  /// Used to initiate a [PATCH] request
  ///
  /// Use the [body] parameter to send the json data to the service
  ///
  /// The [handle] is end point that will be attached to the [baseUrl]
  /// which either can be provided as a whole using the [ApiConfig]
  /// setting or can be overidden as it is given as an option parameter
  /// in the function.
  ///
  /// Same thing applies for the [header] parameter
  Future<dynamic> patch({
    required String handle,
    dynamic body,
    String? baseUrl,
    Map<String, String>? header,
    Duration? timeOut,
    bool enableLogs = false,
  }) async {
    // final url to which call will be made
    var url = (baseUrl ?? ApiConfig.baseUrl) + handle;

    // uri to be passed to request
    var uri = Uri.parse(url);

    // final timeout to be used with request
    var finalTimeout = timeOut ?? ApiConfig.responseTimeOut;

    if (enableLogs) {
      developer.log(
        'Request URl: $url',
        name: 'package.bloc_rest_api.$handle',
      );
      developer.log(
        'Request Header: ${jsonEncode(header)}',
        name: 'package.bloc_rest_api.$handle',
      );
      developer.log(
        'Request Body: $body',
        name: 'package.bloc_rest_api.$handle',
      );
    }
    var rawResponse;
    var responseJson;
    try {
      rawResponse = await _client
          .patch(
            uri,
            body: body,
            headers: header,
          )
          .timeout(finalTimeout);
      if (rawResponse?.statusCode == 401) {
        await authenticationRepository?.refresh();
        if (header?.containsKey("Authorization") == true) {
          header?.update("Authorization", (value) => "Bearer $token");
        }
        rawResponse = await _client
            .patch(
              uri,
              body: body,
              headers: header,
            )
            .timeout(finalTimeout);
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
          'Request Raw Response: $responseJson',
          name: 'package.bloc_rest_api.$handle',
        );
      }
    }
    return responseJson;
  }

  /// Used to initiate a [PUT] request
  ///
  /// Use the [body] parameter to send the json data to the service
  ///
  /// The [handle] is end point that will be attached to the [baseUrl]
  /// which either can be provided as a whole using the [ApiConfig]
  /// setting or can be overidden as it is given as an option parameter
  /// in the function.
  ///
  /// Same thing applies for the [header] parameter
  Future<dynamic> put({
    required String handle,
    dynamic body,
    String? baseUrl,
    Map<String, String>? header,
    Duration? timeOut,
    bool enableLogs = false,
  }) async {
    // final url to which call will be made
    var url = (baseUrl ?? ApiConfig.baseUrl) + handle;

    // uri to be passed to request
    var uri = Uri.parse(url);

    // final timeout to be used with request
    var finalTimeout = timeOut ?? ApiConfig.responseTimeOut;

    if (enableLogs) {
      developer.log(
        'Request URl: $url',
        name: 'package.bloc_rest_api.$handle',
      );
      developer.log(
        'Request Header: ${jsonEncode(header)}',
        name: 'package.bloc_rest_api.$handle',
      );
      developer.log(
        'Request Body: $body',
        name: 'package.bloc_rest_api.$handle',
      );
    }
    var rawResponse;
    var responseJson;
    try {
      rawResponse = await _client
          .put(
            uri,
            body: body,
            headers: header,
          )
          .timeout(finalTimeout);
      if (rawResponse?.statusCode == 401) {
        await authenticationRepository?.refresh();
        if (header?.containsKey("Authorization") == true) {
          header?.update("Authorization", (value) => "Bearer $token");
        }
        rawResponse = await _client
            .put(
              uri,
              body: body,
              headers: header,
            )
            .timeout(finalTimeout);
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
          'Request Raw Response: $responseJson',
          name: 'package.bloc_rest_api.$handle',
        );
      }
    }
    return responseJson;
  }

  /// Used to initiate a [multipart POST] request
  ///
  /// Use the [fields] parameter to send key-value pairs as form data.
  ///
  /// Use the [files] parameter to send files as part of the request.
  Future<dynamic> multipartPost({
    required String handle,
    Map<String, String>? fields,
    List<Map<String, dynamic>>? files,
    String? baseUrl,
    Map<String, String>? header,
    Duration? timeOut,
    bool enableLogs = false,
  }) async {
    // final url to which call will be made
    var url = (baseUrl ?? ApiConfig.baseUrl) + handle;

    // uri to be passed to request
    var uri = Uri.parse(url);

    // final timeout to be used with request
    var finalTimeout = timeOut ?? ApiConfig.responseTimeOut;

    if (enableLogs) {
      developer.log(
        'Multipart Request URl: $url',
        name: 'package.bloc_rest_api.$handle',
      );
      developer.log(
        'Multipart Request Header: ${jsonEncode(header)}',
        name: 'package.bloc_rest_api.$handle',
      );
      developer.log(
        'Multipart Request Fields: $fields',
        name: 'package.bloc_rest_api.$handle',
      );
      developer.log(
        'Multipart Request Files: $files',
        name: 'package.bloc_rest_api.$handle',
      );
    }

    late var rawResponse;
    var responseJson;
    try {
      // create a new http.MultipartRequest
      var request = http.MultipartRequest('POST', uri);

      // add fields to the request
      if (fields != null) {
        request.fields.addAll(fields);
      }

      // add files to the request
      if (files != null) {
        for (var file in files) {
          var fieldName = file['fieldName']!;
          var fileBytes = file['fileBytes'] as List<int>;
          var fileName = file['fileName']!;

          var multipartFile = http.MultipartFile.fromBytes(
            fieldName,
            fileBytes,
            filename: fileName,
          );

          request.files.add(multipartFile);
        }
      }

      // add headers to the request
      if (header != null) {
        request.headers.addAll(header);
      }

      // send the request and get the response
      var streamedResponse = await request.send().timeout(finalTimeout);

      // read the response
      rawResponse = await http.Response.fromStream(streamedResponse);

      if (rawResponse?.statusCode == 401) {
        await authenticationRepository?.refresh();
        if (header?.containsKey("Authorization") == true) {
          header?.update("Authorization", (value) => "Bearer $token");
        }

        // resend the request after refreshing token
        streamedResponse = await request.send().timeout(finalTimeout);
        rawResponse = await http.Response.fromStream(streamedResponse);
      }

      responseJson = await _response(rawResponse);
    } on SocketException {
      throw FetchDataException();
    } on TimeoutException {
      throw TimeOutExceptionC();
    } finally {
      if (enableLogs) {
        developer.log(
          'Multipart Request Response Status: ${rawResponse?.statusCode}',
          name: 'package.bloc_rest_api.$handle',
        );
        developer.log(
          'Multipart Request Raw Response: ${rawResponse.body}',
          name: 'package.bloc_rest_api.$handle',
        );
      }
    }
    return responseJson;
  }

  /// Used to convert a locally provided [json] String to json Map
  Future<dynamic> local(
    String json, {
    bool enableLogs = false,
  }) async {
    if (enableLogs) {
      developer.log(
        'JSON String: $json',
        name: 'package.bloc_rest_api.local',
      );
    }

    var rawResponse;
    try {
      rawResponse = jsonDecode(json);
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      if (enableLogs) {
        developer.log(
          'Raw JSON: $rawResponse',
          name: 'package.bloc_rest_api.local',
        );
      }
    }
    return rawResponse;
  }

  /// gerenal HTTP code responses
  Future<dynamic> _response(http.Response response) async {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = json.decode(response.body.toString());

        return responseJson;
      case 400:
        throw jsonDecode(response.body)["message"].toString();
      case 401:
      case 403:
        throw jsonDecode(response.body)["message"].toString();
      case 500:
      default:
        throw FetchDataException(
            'Something went wrong, please try again later.\n\nStatus Code : ${response.statusCode}');
    }
  }
}
