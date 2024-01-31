import 'dart:developer';

import 'export.dart';

class ApiClient {
  Future request(
    String endpoint, {
    String type = 'get',
    Map<String, dynamic> postData = const {},
  }) async {
    try {
      final dio = Dio(
        BaseOptions(baseUrl: ApiConst.baseUrl),
      );

      final response = type == 'get'
          ? await dio.get(endpoint)
          : await dio.post(
              endpoint,
              data: postData,
            );
      return response.data;
    } catch (e) {
      log("Error $e");
      throw Exception(e);
    }
  }
}

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});
