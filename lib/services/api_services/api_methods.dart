import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:relive_app/services/check_internet_services/check_internet.dart';
import 'package:relive_app/utils/app_message.dart';
import '../../utils/app_files_imports.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class ApiMethods {
  static final ApiMethods _apiClient = ApiMethods._internal();
  final dio = Dio();

  factory ApiMethods() {
    return _apiClient;
  }

  ApiMethods._internal();

  static Map<String, String> getHeaderWithoutToken() {
    return {
      'Content-Type': 'application/json',
      'accept': 'application/json',
      'api-access-token': ApiUrls.apiAccessToken,
    };
  }

  static Future<Map<String, String>> getHeaderWithToken([
    bool? isMultipart,
  ]) async {
    String? accessToken = await AppStorageManager.readData(AppKeys.authToken);
    if (isMultipart ?? false) {
      return {
        'accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };
    } else {
      return {
        'content-type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };
    }
  }

  Future<String> getMethod({
    required String method,
    required Map<String, dynamic>? body,
    Map<String, String>? header,
  }) async {
    if (await CheckInternet.isInternetConnected()) {
      try {
        /*
        log('Get Request url: $method');

        if (header != null) {
          log('header>>>> ${header.toString()}');
        }
        log('Request body: $body');
        */

        /*
        var request = http.Request(
            'GET',
            Uri.parse(
              method,));
        request.body = body.toString();
        if (header != null) {
          request.headers.addAll(header);
        }
        http.StreamedResponse response = await request.send();
        */

        /// HTTP Code commit
        final response = await http.get(
          Uri.parse(method).replace(queryParameters: body),
          headers: header,
        );
        debugPrint(
          'url ---- ${Uri.parse(method).replace(queryParameters: body)} ----',
        );
        debugPrint('header ---- ${header.toString()} ----');
        debugPrint('body ---- ${body.toString()} ----');
        log('response ---- ${response.body.toString()} ----');
        /*
        log('$method >>>>Response body: ${response.body} <<<<');
         */
        return response.body;
      } catch (e) {
        log('___catch___get Method error---$method>>>>> ${e.toString()}<<<<<<');
        return '';
      }
    } else {
      AppMessage.warning('No Internet');
      return '';
    }
  }

  /*void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => log(match.group(0).toString()));
  }*/

  Future<String> postMethod({
    required method,
    required Map<String, dynamic> body,
    Map<String, String>? header,
  }) async {
    if (await CheckInternet.isInternetConnected()) {
      try {
        /*
        log('Post Request url: $method');
        if (header != null) {
          log('Request header:  ${header.toString()}');
        }
        log('Request body: $body');
         */

        /// HTTP Code commit
        final response = await http.post(
          Uri.parse(method),
          body: jsonEncode(body),
          headers: header,
        );
        debugPrint('url ---- ${Uri.parse(method)} ----');
        debugPrint('header ---- ${header.toString()} ----');
        debugPrint('body ---- ${body.toString()} ----');
        log('response ---- ${response.body.toString()} ----');
        /*
        log('$method >>>>Response body: ${response.body} <<<<');
         */
        return response.body;
      } catch (e) {
        log(
          '___catch___post Method error---$method>>>>> ${e.toString()}<<<<<<',
        );
        return '';
      }
    } else {
      AppMessage.warning('No Internet');
      return '';
    }
  }

  Future<String> postMultipartMethod({
    required String method,
    required Map<String, String> body,
    required List<MultipartFile> files,
    required String mapKeyFile,
    required Map<String, String> header,
    required Function(int, int) onProgress,
  }) async {
    try {
      final formData = FormData();
      body.forEach((key, value) {
        formData.fields.add(MapEntry(key, value));
      });
      for (var file in files) {
        if (files.isNotEmpty) {
          formData.files.add(MapEntry(mapKeyFile, file));
        }
      }
      final response = await dio.post(
        method,
        data: formData,
        onReceiveProgress: (start, end) {},
        onSendProgress: onProgress,
        options: Options(
          headers: {...header, 'Content-Type': 'multipart/form-data'},
        ),
      );
      debugPrint('url ---- ${Uri.parse(method)} ----');
      debugPrint('header ---- ${header.toString()} ----');
      debugPrint('body ---- ${body.toString()} ----');
      log('response ---- ${response.data.toString()} ----');
      return jsonEncode(response.data);
    } catch (e) {
      debugPrint('url ---- ${Uri.parse(method)} ----');
      debugPrint('header ---- ${header.toString()} ----');
      debugPrint('body ---- ${body.toString()} ----');
      AppMessage.warning(
        'postMultipartMethod error---$method>>>>> ${e.toString()}<<<<<<',
      );
      log('postMultipartMethod error---$method>>>>> ${e.toString()}<<<<<<');
      return '';
    }
  }

  Future<String> postMultipartMethodForMultipleFiles({
    required String method,
    required Map<String, String> body,
    required Map<String, File>
    files, // Using a Map to specify param names for each file
    required Map<String, String> header,
    required Function(int, int) onProgress,
  }) async {
    try {
      final formData = FormData();

      // Add body fields to formData
      body.forEach((key, value) {
        formData.fields.add(MapEntry(key, value));
      });

      // Add files with corresponding parameter names to formData
      files.forEach((paramName, file) async {
        var multipartFile = await MultipartFile.fromFile(
          file.path,
          filename: basename(file.path),
        );
        formData.files.add(MapEntry(paramName, multipartFile));
        debugPrint('Adding file: ${file.path} as $paramName');
      });

      // Make the Dio post request
      final response = await dio.post(
        method,
        data: formData,
        onReceiveProgress: (start, end) {
          debugPrint('onReceiveProgress start >> $start and end >> $end');
        },
        onSendProgress: onProgress,
        options: Options(
          headers: {...header, 'Content-Type': 'multipart/form-data'},
        ),
      );
      debugPrint('url ---- ${Uri.parse(method)} ----');
      debugPrint('header ---- ${header.toString()} ----');
      debugPrint('body ---- ${body.toString()} ----');
      log('response ---- ${response.data.toString()} ----');
      return jsonEncode(response.data);
    } catch (e) {
      AppMessage.warning(
        'postMultipartMethod error---$method>>>>> ${e.toString()}<<<<<<',
      );
      log('postMultipartMethod error---$method>>>>> ${e.toString()}<<<<<<');
      return '';
    }
  }

  Future<String> postMultipartMethodForXFiles({
    required String method,
    required Map<String, String> body,
    required Map<String, XFile>
    files, // Using a Map to specify param names for each file
    required Map<String, String> header,
    required Function(int, int) onProgress,
  }) async {
    try {
      final formData = FormData();

      // Add body fields to formData
      body.forEach((key, value) {
        formData.fields.add(MapEntry(key, value));
      });

      // Add files with corresponding parameter names to formData
      files.forEach((paramName, file) async {
        var multipartFile = await MultipartFile.fromFile(
          file.path,
          filename: basename(file.path),
        );
        formData.files.add(MapEntry(paramName, multipartFile));
        debugPrint(
          'Adding file: ${file.path} as $paramName and files length is ${files.length.toString()}',
        );
      });

      // Make the Dio post request
      final response = await dio.post(
        method,
        data: formData,
        onReceiveProgress: (start, end) {
          debugPrint('onReceiveProgress start >> $start and end >> $end');
        },
        onSendProgress: onProgress,
        options: Options(
          headers: {...header, 'Content-Type': 'multipart/form-data'},
        ),
      );
      debugPrint('url ---- ${Uri.parse(method)} ----');
      debugPrint('header ---- ${header.toString()} ----');
      debugPrint('body ---- ${body.toString()} ----');
      log('response ---- ${response.data.toString()} ----');
      return jsonEncode(response.data);
    } catch (e) {
      AppMessage.warning(e.toString());
      log('postMultipartMethodForXFiles ---- ${e.toString()}');
      return '';
    }
  }

  /// HTTP Code commit

  Future<String> postMethodMultipart({
    required http.MultipartRequest request,
  }) async {
    if (await CheckInternet.isInternetConnected()) {
      try {
        /*
        log('PostMultipart Request url: ${request.url.path}');
        log('Request header: ${request.headers}');
        log('Request body: ${request.fields}');
        log('Request files: ${request.files}');
         */
        http.Response result = await http.Response.fromStream(
          await request.send(),
        );
        /*
        log('${request.url.path} >>>>Response body: ${result.body} <<<<');
         */
        return result.body;
      } catch (e) {
        log(
          '___catch___postMethodMultipart error---${request.url.path}>>>>> ${e.toString()}<<<<<<',
        );
        return '';
      }
    } else {
      AppMessage.warning('No Internet');
      return '';
    }
  }
}
