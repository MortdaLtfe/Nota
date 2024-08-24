import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/profile/controllers/profile_controller.dart';
import 'package:nota/features/profile/cubit/profile_cubit.dart';
import 'package:nota/shared/widgets/customauthbutton.dart';
import 'package:nota/shared/widgets/customauthfield.dart';
import 'package:nota/utils/constants/styles.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late ProfileController profileController;
  @override
  void initState() {
    super.initState();
    profileController = ProfileController(context: context);
    profileController.initState();
  }

  @override
  void dispose() {
    super.dispose();
    profileController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hello, ${profileController.user.displayName}",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: containerPadding,
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              Form(
                  key: profileController.formKey,
                  child: Wrap(runSpacing: 30.0, children: [
                    BlocConsumer<ProfileCubit, ProfileState>(
                        builder: (context, state) {
                      if (state is ProfileFailure) {
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
                    }, listener: (context, state) {
                      if (state is ProfileChanged) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }
                    }),
                    Wrap(
                        runSpacing: 20.0,
                        children: profileController.inputs
                            .map((input) => CustomAuthField(
                                disabled: input["disabled"],
                                hint: input["hint"],
                                title: input["title"],
                                controller: input["controller"],
                                validator: input["validator"]))
                            .toList()),
                    BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        if (state is ProfileLoading) {
                          return CustomAuthButton(
                            onPressed: () {},
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }
                        return CustomAuthButton(
                            onPressed: profileController.onButtonClicked,
                            child: Text("Save Changes",
                                style:
                                    Theme.of(context).textTheme.headlineSmall));
                      },
                    )
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
