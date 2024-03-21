// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:musafir_music/_utils/api_response.dart';
// import 'package:musafir_music/_utils/enum.dart';

// class ApiCall<T> {
//   final Dio dio = Dio();
//   bool isConnected = true;

//   Future<APIResponse<T>> handleApi({
//     required String endpoint,
//     bool appendHeader = true,
//     Map<String, dynamic>? headers,
//     Map<String, dynamic>? queryParams,
//     dynamic body,
//     Uri? fullUri,
//     ApiCallType apiCallType = ApiCallType.GET,
//     required Future<Either<Failure, T>> Function(Map responseBody)
//         handleSuccess,
//     Future<Either<Failure, T>> Function(Map responseBody)? handle400,
//     Future<Either<Failure, T>> Function(Map responseBody)? handle401,
//     Future<Either<Failure, T>> Function(Map responseBody)? handle500,
//     Future<Either<Failure, T>> Function(Map responseBody)? handleError,
//   }) async {
//     if (isConnected) {

//       Map<String, dynamic> callHeader = {
//         'Accept': "application/json",
//         'Content-Type': "application/json",
//       };

//       try{
//         late Response<dynamic> response;
//         final uri = fullUri ?? Uri.parse("");
//       }
//     }
//   }
// }
