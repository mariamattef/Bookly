import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);
  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('connection timeout with apiService');
      case DioExceptionType.sendTimeout:
        return ServerFailure('send timeout with apiService');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('receive timeout with apiService');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad request with apiService');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Cancel Request with apiService');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error with apiService');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet connection');
        }
        return ServerFailure('UnExpected Error with apiService,,Try again');
    }
  }
  factory ServerFailure.fromResponse(dynamic response, int statusCode) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('your equest Not Found  Please try later');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error. Please try again later');
    } else {
      return ServerFailure('Opps There was an error, please try again later');
    }
  }
}
