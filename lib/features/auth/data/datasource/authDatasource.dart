import 'dart:convert';

import 'package:instightful_interviews_app/core/api.dart';
import 'package:instightful_interviews_app/features/auth/data/model/UserModel.dart';
import 'package:instightful_interviews_app/features/auth/domain/DTO/LoginDTO.dart';
import 'package:instightful_interviews_app/features/auth/domain/DTO/SignupDTO.dart';

import '../../../../core/error/exception.dart';

abstract class AuthDatasource {
  Future<UserModel> login({required String username, required String password});
  void signup({required SignupDTO dto});
  Future<UserModel> updateAccount({required UserModel userModel});
  void deleteAccount({required String username});
  Future<UserModel> getUserDetails({required String username});
}

class AuthDatasourceImpl implements AuthDatasource {
  final API api = API();
  @override
  Future<UserModel> login(
      {required String username, required String password}) async {
    try {
      final LoginDTO param = LoginDTO(username: username, password: password);
      final response =
          await api.post(path: "auth/login", params: param.toMap());

      final UserModel user = UserModel.fromJson(json.decode(response));
      return user;
    } catch (e) {
      throw AuthException(message: e.toString());
    }
  }

  @override
  Future<void> signup({required SignupDTO dto}) async {
    try {
      await api.post(path: "auth/signup", params: dto.toMap());
    } catch (e) {
      throw AuthException(message: e.toString());
    }
  }

  @override
  Future<UserModel> updateAccount({required UserModel userModel}) async {
    try {
      final response = await api.post(
          path: "auth/update-account", params: userModel.toMap());
      final UserModel user = UserModel.fromJson(json.decode(response));
      return user;
    } catch (e) {
      throw AuthException(message: e.toString());
    }
  }

  @override
  Future<void> deleteAccount({required String username}) async {
    try {
      await api.post(path: "auth/delete-account", params: {"email": username});
    } catch (e) {
      throw AuthException(message: e.toString());
    }
  }

  @override
  Future<UserModel> getUserDetails({required String username}) async {
    try {
      final UserModel user =
          await api.post(path: "auth/get-profile", params: {"email": username});
      return user;
    } catch (e) {
      throw AuthException(message: e.toString());
    }
  }
}
