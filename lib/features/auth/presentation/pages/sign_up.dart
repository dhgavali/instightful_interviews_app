import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instightful_interviews_app/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:instightful_interviews_app/routes/route_names.dart';

import '../../../../core/components/loading.dart';
import '../../data/repository/authRepositoryImpl.dart';
import '../widgets/auth_backgound.dart';
import '../widgets/auth_textfields.dart';
import '../widgets/auth_texts.dart';
import '../widgets/buttons.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthTexts authTexts = AuthTexts();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    var _formKey = GlobalKey<FormState>();
    final AuthRepositoryImpl authRepository = AuthRepositoryImpl();

    return AuthBackgroundScaffold(
      child: BlocProvider(
        create: (context) => AuthBloc(authRepository: authRepository),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is SignupSuccessState)
              Get.toNamed(RoutesNames.loginScreen);
          },
          builder: (context, state) {
            if (state is AuthLoadingState) return Loadings.basic();
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 70.h),
                authTexts.title("Create Account"),
                authTexts.subtitle("to get started now!"),
                SizedBox(height: 25.h),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        AuthTextField(
                          isPassword: false,
                          hint: "Name",
                          controller: nameController,
                        ),
                        const SizedBox(height: 10),
                        AuthTextField(
                          isPassword: false,
                          hint: "Email Address",
                          controller: emailController,
                        ),
                        const SizedBox(height: 10),
                        AuthTextField(
                          isPassword: true,
                          hint: "Password",
                          controller: passwordController,
                        ),
                        const SizedBox(height: 10),
                        AuthTextField(
                          isPassword: false,
                          isObscure: true,
                          hint: "Confrim Password",
                          controller: confirmPasswordController,
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
                    )),
                SizedBox(height: 20.h),
                LoginButton(
                  "Continue",
                  onPressed: () => context.read<AuthBloc>().add(UserSignupEvent(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      confirmPassword: confirmPasswordController.text)),
                ),
                SizedBox(height: 50.h),
                Text(
                  "Or Login with",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
                SizedBox(height: 20.h),
                SocialLoginButtons(),
                SizedBox(height: 80.h),
                ChangeAuthTextButton(isLogin: false),
              ],
            );
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
