import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

/// This class defines various network exceptions that can occur during API calls.
/// It uses the Freezed package to generate immutable classes for each exception type.
@freezed
abstract class NetworkExceptions with _$NetworkExceptions implements Exception {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorisedRequest() = UnauthorisedRequest;

  const factory NetworkExceptions.invalidCredentials() = InvalidCredentials;

  const factory NetworkExceptions.badRequest() = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  const factory NetworkExceptions.connectionError() = ConnectionError;
  const factory NetworkExceptions.badCertificate() = BadCertificate;

  /// Helper method to convert DioException or SocketException to NetworkExceptions
  /// This method takes an error object and returns a corresponding NetworkExceptions instance.
  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        late NetworkExceptions networkExceptions;
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              networkExceptions = const NetworkExceptions.requestCancelled();
              break;
            case DioExceptionType.connectionTimeout:
              networkExceptions = const NetworkExceptions.requestTimeout();
              break;
            case DioExceptionType.unknown:
              networkExceptions =
                  const NetworkExceptions.noInternetConnection();
              break;
            case DioExceptionType.receiveTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioExceptionType.badResponse:
              switch (error.response?.statusCode ?? 0) {
                case 400:
                  networkExceptions =
                      const NetworkExceptions.unauthorisedRequest();
                  break;
                case 401:
                  networkExceptions =
                      const NetworkExceptions.invalidCredentials();
                  break;
                case 403:
                  networkExceptions =
                      const NetworkExceptions.unauthorisedRequest();
                  break;
                case 404:
                  networkExceptions = const NetworkExceptions.notFound(
                    'Неправильный адрес',
                  );
                  //'Неправильный логин или пароль');
                  break;
                case 409:
                  networkExceptions = const NetworkExceptions.conflict();
                  break;
                case 408:
                  networkExceptions = const NetworkExceptions.requestTimeout();
                  break;
                case 500:
                  networkExceptions =
                      const NetworkExceptions.internalServerError();
                  break;
                case 503:
                  networkExceptions =
                      const NetworkExceptions.serviceUnavailable();
                  break;
                default:
                  var responseCode = error.response?.statusCode ?? 0;
                  networkExceptions = NetworkExceptions.defaultError(
                    'Received invalid status code: $responseCode',
                  );
              }
              break;
            case DioExceptionType.sendTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioExceptionType.badCertificate:
              networkExceptions = const NetworkExceptions.badCertificate();
              break;
            case DioExceptionType.connectionError:
              networkExceptions = const NetworkExceptions.connectionError();
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (_) {
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains('is not a subtype of')) {
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  /// Helper method to get a user-friendly error message from NetworkExceptions
  /// This method takes a NetworkExceptions instance and returns a string message
  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = '';
    switch (networkExceptions.runtimeType) {
      case const (NotImplemented):
        errorMessage = 'Not implemented';
        break;
      case const (ConnectionError):
        errorMessage = 'Connection error';
        break;
      case const (RequestCancelled):
        errorMessage = 'Request cancelled';
        break;
      case const (InternalServerError):
        errorMessage = 'Internal server error';
        break;
      case const (NotFound):
        errorMessage = (networkExceptions as NotFound).reason;
        break;
      case const (ServiceUnavailable):
        errorMessage = 'Service unavailable';
        break;
      case const (MethodNotAllowed):
        errorMessage = 'Method not allowed';
        break;
      case const (BadRequest):
        errorMessage = 'Bad request';
        break;
      case const (UnauthorisedRequest):
        errorMessage = 'Unauthorized';
        break;
      case const (InvalidCredentials):
        errorMessage = 'Invalid username or password';
        break;
      case const (UnexpectedError):
        errorMessage = 'An unexpected error occurred';
        break;
      case const (RequestTimeout):
        errorMessage = 'Connection timeout';
        break;
      case const (NoInternetConnection):
        errorMessage = 'No internet connection';
        break;
      case const (Conflict):
        errorMessage = 'Conflict error';
        break;
      case const (SendTimeout):
        errorMessage = 'Send timeout in connection with server';
        break;
      case const (UnableToProcess):
        errorMessage = 'Unable to process data';
        break;
      case const (DefaultError):
        errorMessage = (networkExceptions as DefaultError).error;
        break;
      case const (FormatException):
        errorMessage = 'An unexpected error occurred';
        break;
         case const (BadCertificate):
        errorMessage = 'Bad certificate';
        break;
      case const (NotAcceptable):
        errorMessage = 'Not acceptable';
        break;
      default:
        errorMessage = 'An unexpected error occurred';
        break;
    }
    if (errorMessage.isEmpty) {
      errorMessage = 'An unexpected error occurred';
    }
    return errorMessage;
  }
}
