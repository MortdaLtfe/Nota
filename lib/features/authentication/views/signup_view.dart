import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nota/features/authentication/controller/signup_controller.dart';
import 'package:nota/features/authentication/cubit/authentication_cubit.dart';
import 'package:nota/shared/widgets/customauthbutton.dart';
import 'package:nota/shared/widgets/customauthfield.dart';
import 'package:nota/utils/constants/styles.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  late SignupController signupController;

  @override
  void initState() {
    super.initState();
    signupController = SignupController(context: context);
    signupController.logger.i(context.read<AuthenticationCubit>());
  }

  @override
  void dispose() {
    super.dispose();
    signupController.emailController.dispose();
    signupController.passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          padding: containerPadding,
          child: Wrap(
            runSpacing: 20,
            children: [
              Wrap(runSpacing: 5, children: [
                Text(
                  "Sign up",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "Sign up to your account, to get access to all features",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).textTheme.labelSmall!.color),
                )
              ]),
              Form(
                key: signupController.formState,
                child: Wrap(
                  runSpacing: 20,
                  children: [
                    BlocConsumer<AuthenticationCubit, AuthenticationState>(
                      builder: (context, state) {
                        if (state is AuthenticationSignupError) {
                          return Container(
                            padding: const EdgeInsets.all(15),
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                            child: Text(
                              state.message,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          );
                        }
                        return Container();
                      },
                      listener: (context, state) {
                        if (state is AuthenticationSignupSuccess) {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        }
                      },
                    ),
                    CustomAuthField(
                      hint: "e.g: Mortdha Ltfe",
                      title: "Name",
                      controller: signupController.nameController,
                      validator: signupController.nameValidator,
                    ),
                    CustomAuthField(
                      hint: "e.g: mortdha@example.com",
                      title: "Email",
                      controller: signupController.emailController,
                      validator: signupController.emailValidator,
                    ),
                    CustomAuthField(
                      hint: "e.g: ******",
                      title: "Password",
                      controller: signupController.passwordController,
                      validator: signupController.passwordValidator,
                    ),
                    BlocBuilder<AuthenticationCubit, AuthenticationState>(
                      builder: (context, state) {
                        if (state is AuthenticationSignupLoading) {
                          return CustomAuthButton(
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                              onPressed: () {});
                        }

                        return CustomAuthButton(
                            onPressed: signupController.onButtonClick,
                            child: Text("Sign up",
                                style:
                                    Theme.of(context).textTheme.headlineSmall));
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
