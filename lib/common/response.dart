import 'dart:io';

// ignore: implementation_imports
import 'package:vania/src/exception/validation_exception.dart';
import 'package:vania/vania.dart';

class JsonResponse {
  static Response send({
    String? message,
    dynamic data,
    dynamic errors,
    int status = HttpStatus.ok,
  }) {
    return Response.json(
      {
        'message': message,
        'data': data,
        'errors': errors,
      },
      status,
    );
  }

  static Response handleError(Object e) {
    print(e);
    return e is ValidationException
        ? JsonResponse.send(
            message: "Validation Error",
            errors: e.message,
            status: e.code,
          )
        : JsonResponse.send(
            message: 'Terjadi kesalahan, coba lagi beberapa saat',
            status: HttpStatus.internalServerError,
          );
  }
}