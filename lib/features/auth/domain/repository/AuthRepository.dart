import 'package:dartz/dartz.dart';
import 'package:instightful_interviews_app/core/error/failure.dart';
import 'package:instightful_interviews_app/features/auth/data/model/UserModel.dart';
import 'package:instightful_interviews_app/features/auth/domain/DTO/SignupDTO.dart';

abstract class AuthRepository {
  //login
  ///[Username] can be email or username
  Future<Either<Failure, UserModel>> loginUser(
      {required String username, required String password});

  //signup
  Future<Either<Failure, void>> signUpUser({required SignupDTO dto});

  //update account
  Future<Either<Failure, UserModel>> updateUser({required UserModel user});

  //delte account
  Future<Either<Failure, void>> delteAccount({required String username});

  //forgot password

  //logout
  void logout();

  //get profile details
  Future<Either<Failure, UserModel>> getUserDetails({required String username});
}
