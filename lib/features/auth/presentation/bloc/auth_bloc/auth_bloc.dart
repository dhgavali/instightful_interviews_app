import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:instightful_interviews_app/features/auth/domain/DTO/SignupDTO.dart';

import '../../../../../core/error/failure.dart';
import '../../../data/model/UserModel.dart';
import '../../../data/repository/authRepositoryImpl.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositoryImpl authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitialState()) {
    //Sign In
    on<UserSignInEvent>((event, emit) async {
      if (event.email == "") {
        emit(const AuthFailureState(message: "Email cannot be empty"));
      } else if (!isEmail(event.email)) {
        emit(const AuthFailureState(message: "Invalid Email"));
      } else if (event.password.length < 6) {
        emit(const AuthFailureState(
            message: "Password should be more than 6 characters"));
      } else {
        emit(AuthLoadingState());

        final userModelOrError = await authRepository.loginUser(
            username: event.email, password: event.password);
        print("here");

        userModelOrError.fold((l) {
          emit(AuthFailureState(message: l.message));
        }, (r) => emit(AuthSuccessState(user: r)));
      }
    });

    //Sign Up
    on<UserSignupEvent>((event, emit) async {
      if (event.name == "") {
        emit(const AuthFailureState(message: "Name cannot be empty"));
      } else if (event.email == "") {
        emit(const AuthFailureState(message: "Email cannot be empty"));
      } else if (!isEmail(event.email)) {
        emit(const AuthFailureState(message: "Invalid Email"));
      } else if (event.password.length < 6) {
        emit(const AuthFailureState(
            message: "Password should be more than 6 characters"));
      } else if (event.password != event.confirmPassword) {
        emit(const AuthFailureState(
            message: "Passowrd and Confirm Password do not match"));
      } else {
        emit(AuthLoadingState());

        final SignupDTO user = SignupDTO(
            event.email, event.password, event.email, event.name, "user");
        final signUpOrFailure = await authRepository.signUpUser(dto: user);

        signUpOrFailure.fold((l) => emit(AuthFailureState(message: l.message)),
            (r) => emit(SignupSuccessState()));
      }
      if (state is AuthFailureState) {
        await Future.delayed(const Duration(seconds: 3));
        emit(AuthInitialState());
      }
    });

    //Delete Account
    on<UserAccountDeleteEvent>((event, emit) async {
      emit(AuthLoadingState());

      final delteAccountOrFailure =
          await authRepository.delteAccount(username: event.email);

      delteAccountOrFailure.fold(
          (l) => AuthFailure(message: l.message), (r) => AuthInitialState());
    });
  }
  //Forgot password
  //   on<SendResetEmailEvent>((event, emit) async {
  //     emit(AuthLoadingState());

  //     final sendResetEmail =
  //         await authRepository.sendresetPassordEmail(event.email);

  //     sendResetEmail.fold(
  //         (l) => AuthFailure(message: l.message), (r) => AuthEmailSentState());
  //   });

  //   on<ConfirmResetEvent>((event, emit) async {
  //     emit(AuthLoadingState());

  //     final confirmRestetOrFailure = await authRepository.confirmResetPassord(
  //         event.email, event.code, event.password);

  //     confirmRestetOrFailure.fold(
  //         (l) => AuthFailure(message: l.message), (r) => AuthInitialState());
  //   });
  // }

  bool isEmail(String text) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text);
  }
}
