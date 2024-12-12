import 'dart:io';

import 'package:paml_rest_api/app/models/user.dart';
import 'package:paml_rest_api/common/response.dart';
import 'package:vania/vania.dart';

class UserController extends Controller {
  Future<Response> currentUser(Request req) async {
    try {
      final currUser = Auth().user();
      if (currUser == null) {
        return JsonResponse.send(
          message: "User not identified",
          status: HttpStatus.unauthorized,
        );
      }

      // Omit password dari Map
      currUser.remove('password');

      return JsonResponse.send(
        message: "User identified",
        data: currUser,
      );
    } catch (e) {
      return JsonResponse.handleError(e);
    }
  }

  Future<Response> changePassword(Request req) async {
    try {
      req.validate({
        'old_password': 'required',
        'new_password': 'required|min_length:6',
      }, {
        'old_password.required': 'Password lama tidak boleh kosong',
        'new_password.required': 'Password baru tidak boleh kosong',
        'new_password.min_length': 'Password baru minimal 6 karakter',
      });

      final currUser = Auth().user();
      if (currUser == null) {
        return JsonResponse.send(
          message: "User not identified",
          status: HttpStatus.unauthorized,
        );
      }
      // Validasi password lama
      if (!Hash().verify(req.string('old_password'), currUser['password'])) {
        return JsonResponse.send(
          message: "Password lama tidak sesuai",
          status: HttpStatus.unauthorized,
        );
      }

      // Update password user
      final newHashedPassword = Hash().make(req.string('new_password'));
      await User().query().where('id', "=", currUser['id']).update({
        'password': newHashedPassword,
        'updated_at': DateTime.now(),
      });

      return JsonResponse.send(
        message: "Berhasil mengganti password",
      );
    } catch (e) {
      return JsonResponse.handleError(e);
    }
  }
}

final UserController userController = UserController();
