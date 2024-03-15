import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instightful_interviews_app/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:instightful_interviews_app/features/auth/presentation/widgets/auth_texts.dart';
import 'package:instightful_interviews_app/routes/route_names.dart';
import '../../../../core/components/loading.dart';
import '../../data/repository/authRepositoryImpl.dart';
import '../widgets/auth_backgound.dart';
import '../widgets/auth_textfields.dart';
import '../widgets/buttons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthTexts authTexts = AuthTexts();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final AuthRepositoryImpl authRepository = AuthRepositoryImpl();
    var _formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => AuthBloc(authRepository: authRepository),
      child: AuthBackgroundScaffold(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccessState) {
              Get.toNamed(RoutesNames.homeScreen);
            }
          },
          builder: (context, state) {
            if (state is AuthLoadingState) {
              return Loadings.basic();
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 70.h),
                  authTexts.title("Welcome,"),
                  authTexts.subtitle("Glad to see you!"),
                  SizedBox(height: 45.h),
                  Form(
                    child: Column(
                      children: [
                        AuthTextField(
                          isPassword: false,
                          hint: "Email",
                          controller: emailController,
                        ),
                        const SizedBox(height: 10),
                        AuthTextField(
                          isPassword: true,
                          hint: "Password",
                          controller: passwordController,
                        ),
                        forgotPasswordButton(),
                        (state is AuthFailureState)
                            ? Text(
                                state.message,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.sp),
                              )
                            : const Text(""),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  LoginButton(
                    "Login",
                    onPressed: () => context.read<AuthBloc>().add(
                          UserSignInEvent(
                              email: emailController.text,
                              password: passwordController.text),
                        ),
                  ),
                  SizedBox(height: 50.h),
                  Text(
                    "Or Login with",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                  SizedBox(height: 20.h),
                  SocialLoginButtons(),
                  SizedBox(height: 150.h),
                  const ChangeAuthTextButton(isLogin: true),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Row forgotPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero)),
            onPressed: () {},
            child: const Text(
              "Forgot Password?",
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
