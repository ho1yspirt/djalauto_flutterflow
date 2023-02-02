import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SinglePaperFirebaseRealtimeDBCall {
  static Future<ApiCallResponse> call({
    String? paperId = '0',
    String? paperQuestionsList = 'questions',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'singlePaperFirebaseRealtimeDB',
      apiUrl:
          'https://djal-auto-be4ed-default-rtdb.europe-west1.firebasedatabase.app/papers/${paperId}.json',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'app/papers',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic root(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class PapersFirebaseRealtimeDBCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'PapersFirebaseRealtimeDB',
      apiUrl:
          'https://djal-auto-be4ed-default-rtdb.europe-west1.firebasedatabase.app/papers.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic root(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class GetUserByPhoneCall {
  static Future<ApiCallResponse> call({
    String? userPhone = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getUserByPhone',
      apiUrl:
          'https://firestore.googleapis.com/v1/projects/djal-auto-be4ed/databases/(default)/documents/users/%2B${userPhone}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  static dynamic root(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
