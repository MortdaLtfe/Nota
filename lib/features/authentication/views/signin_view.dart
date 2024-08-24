import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/authentication/controller/signin_controller.dart';
import 'package:nota/features/authentication/cubit/authentication_cubit.dart';
import 'package:nota/features/authentication/views/signup_view.dart';
import 'package:nota/shared/widgets/customauthbutton.dart';
import 'package:nota/shared/widgets/customauthfield.dart';
import 'package:nota/utils/constants/colors.dart';
import 'package:nota/utils/constants/styles.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  late SigninController signinController;

  @override
  void initState() {
    super.initState();
    signinController = SigninController(context: context);
  }

  @override
  void dispose() {
    super.dispose();
    signinController.emailController.dispose();
    signinController.passwordController.dispose();
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
                  "Sign in",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "Sign in to your account, to get access to all features",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).textTheme.labelSmall!.color),
                )
              ]),
              Form(
                key: signinController.formState,
                child: Wrap(
                  runSpacing: 20,
                  children: [
                    BlocConsumer<AuthenticationCubit, AuthenticationState>(
                      listener: (context, state) {
                        if (state is AuthenticationSigninSuccess) {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          return;
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthenticationSigninError) {
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
                    ),
                    CustomAuthField(
                      hint: "e.g: mortdha@example.com",
                      title: "Email",
                      controller: signinController.emailController,
                      validator: signinController.emailValidator,
                    ),
                    CustomAuthField(
                      hint: "e.g: ******",
                      title: "Password",
                      controller: signinController.passwordController,
                      validator: signinController.passwordValidator,
                    ),
                    InkWell(
                        onTap: () {},
                        child: Text("Forgot Password ?",
                            style: Theme.of(context).textTheme.labelSmall)),
                    BlocBuilder<AuthenticationCubit, AuthenticationState>(
                        builder: (context, state) {
                      if (state is AuthenticationSigninLoading) {
                        return CustomAuthButton(
                            onPressed: () {},
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                            ));
                      }
                      return CustomAuthButton(
                          onPressed: signinController.onButtonClick,
                          child: Text("Sign in",
                              style:
                                  Theme.of(context).textTheme.headlineSmall));
                    }),
                  ],
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BlocProvider<AuthenticationCubit>.value(
                                  value: context.read<AuthenticationCubit>(),
                                  child: const SignupView(),
                                )));
                  },
                  child: Text(
                    "Have an account ?",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: sageGreen),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
