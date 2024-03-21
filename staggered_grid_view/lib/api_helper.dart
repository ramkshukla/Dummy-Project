// import 'dart:convert';

// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:logger/logger.dart';
// import 'package:staggered_grid_view/api_response.dart';
// import 'package:staggered_grid_view/common_component.dart';
// import 'package:staggered_grid_view/enum.dart';

// class ApiCall<T> {
//   // Logger instance records each logs in file.
//   final Logger _logger = Logger();

//   // Dio [_dio] instance handle all api request
//   final Dio dio = Dio();

//   Future<APIResponse<T>> handleAPI({
//     required String endpoint,
//     bool appendheader = true,
//     Map<String, dynamic>? headers,
//     Map<String, dynamic>? queryParams,
//     dynamic body,
//     Uri? fullUri,
//     APICALLTYPE callType = APICALLTYPE.GET,
//     required Future<Either<Failure, T>> Function(Map responseBody)
//         handleSuccess,
//     Future<Either<Failure, T>> Function(Map responseBody)? handle400,
//     Future<Either<Failure, T>> Function(Map responseBody)? handle401,
//     Future<Either<Failure, T>> Function(Map responseBody)? handle500,
//     Future<Either<Failure, T>> Function(Failure failure)? handleError,
//   }) async {
//     // CallHeader
//     Map<String, dynamic> callHeader = {
//       "Accept": "application/json",
//       "Content-Type": "application/json",
//       "device-type": "1234567890"
//     };

//     if (appendheader) {
//       callHeader.addAll(headers ?? {});
//     } else {
//       callHeader = headers ?? {};
//     }

//     try {
//       late Response<dynamic> response;
//       final uri = fullUri ?? Uri.parse("");
//       if (body != null) {
//         body = jsonDecode(body);
//       }

//       if (callType == APICALLTYPE.get) {
//         response = await dio.get(uri.toString());
//       }
//       if (callType == APICALLTYPE.post) {
//         response = await dio.post(uri.toString());
//       }
//       if (callType == APICALLTYPE.put) {
//         response = await dio.put(uri.toString());
//       }

//       final responseBody = 
//       // if(callType == API)
//     } catch (e) {
//       e.toString().logIt;
//     }
//   }
// }
