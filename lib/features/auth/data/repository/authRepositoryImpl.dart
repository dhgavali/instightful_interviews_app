import 'package:dartz/dartz.dart';
import 'package:instightful_interviews_app/core/error/exception.dart';
import 'package:instightful_interviews_app/core/error/failure.dart';
import 'package:instightful_interviews_app/features/auth/data/datasource/authDatasource.dart';
import 'package:instightful_interviews_app/features/auth/data/model/UserModel.dart';
import 'package:instightful_interviews_app/features/auth/domain/DTO/SignupDTO.dart';
import 'package:instightful_interviews_app/features/auth/domain/repository/AuthRepository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasourceImpl datasource = AuthDatasourceImpl();
  @override
  Future<Either<Failure, void>> delteAccount({required String username}) async {
    try {
      await datasource.deleteAccount(username: username);
      return Right(());
    } on AuthException catch (e) {
      return Left(AuthFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: "Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, UserModel>> loginUser(
      {required String username, required String password}) async {
    try {
      final UserModel user =
          await datasource.login(username: username, password: password);
      return Right(user);
    } on AuthException catch (e) {
      return Left(AuthFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: "Something went wrong"));
    }
  }

  @override
  void logout() {
    // TODO: implement logout
  }

  @override
  Future<Either<Failure, void>> signUpUser({required SignupDTO dto}) async {
    try {
      await datasource.signup(dto: dto);
      return Right(());
    } on AuthException catch (e) {
      return Left(AuthFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: "Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateUser(
      {required UserModel user}) async {
    throw UnimplementedError();
    // try {
    //   await datasource.updateAccount(userModel: user);
    // } on AuthException catch (e) {
    //   return Left(AuthFailure(message: e.message));
    // } catch (e) {
    //   return Left(ServerFailure(message: "Something went wrong"));
    // }
    // return Left(ServerFailure(message: "Something went wrong"));
  }

  @override
  Future<Either<Failure, UserModel>> getUserDetails({required String username}) async{
   try {
      final UserModel user =
          await datasource.getUserDetails(username: username);
      return Right(user);
    } on AuthException catch (e) {
      return Left(AuthFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: "Something went wrong"));
    }
  }
}
