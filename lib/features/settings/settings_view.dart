import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:nota/features/about/about_view.dart';
import 'package:nota/features/authentication/cubit/authentication_cubit.dart';
import 'package:nota/features/backup/views/backup_view.dart';
import 'package:nota/features/profile/views/profile_view.dart';
import 'package:nota/utils/constants/styles.dart';
import 'package:nota/features/authentication/views/signin_view.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  User? user = FirebaseAuth.instance.currentUser;
  Logger logger = Logger();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        padding: containerPadding,
        child: Wrap(
          runSpacing: 10,
          spacing: 10,
          children: [
            SettingsProfile(user: user),
            if (FirebaseAuth.instance.currentUser == null)
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BlocProvider<AuthenticationCubit>.value(
                                    value: context.read<AuthenticationCubit>(),
                                    child: const SigninView())));
                  },
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: Text(
                    "Sign up",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            SettingsList(
              user: user,
            )
          ],
        ),
      ),
    );
  }
}

class SettingsList extends StatelessWidget {
  final User? user;
  const SettingsList({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final List items = [
      {
        "title": "Profile",
        "icon": Icons.person,
        "onTap": () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfileView())),
        "authenticated": true
      },
      {
        "title": "Back-up",
        "icon": Icons.sync_outlined,
        "onTap": () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BackupView())),
        "authenticated": true
      },
      {
        "title": "About",
        "icon": Icons.group,
        "onTap": () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AboutView())),
        "authenticated": false
      },
      {
        "title": "Logout",
        "icon": Icons.logout_outlined,
        "onTap": () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(
                      "Logout Confirmation",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontSize: 30),
                    ),
                    backgroundColor: Color(0xff1f1f1f),
                    content: const Text(
                      "Are you sure you want to logout?",
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel",
                              style: Theme.of(context).textTheme.bodyMedium)),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            FirebaseAuth.instance.signOut();
                          },
                          child: Text(
                            "Logout",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.red,
                                ),
                          ))
                    ],
                  ));
          FirebaseAuth.instance.signOut();
        },
        "authenticated": true
      }
    ];
    return Container(
        decoration: BoxDecoration(
          color: Colors.white10,
          border: Border.all(),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Wrap(
          runSpacing: 20,
          spacing: 10,
          children: items.map((element) {
            // ignore: unnecessary_null_comparison
            if (user == null && element["authenticated"] == true) {
              return const Visibility(
                visible: false,
                child: Text("Easy Babe"),
              );
            }
            return InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: element["onTap"],
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 14),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                element["icon"],
                                color: const Color(0xff873AB6),
                                size: 28,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                element["title"],
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.white,
                            size: 20,
                          )
                        ])));
          }).toList(),
        ));
  }
}

class SettingsProfile extends StatefulWidget {
  final User? user;
  const SettingsProfile({super.key, required this.user});

  @override
  State<SettingsProfile> createState() => SettingsProfileState();
}

class SettingsProfileState extends State<SettingsProfile> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Center(
            child: ClipRRect(
          borderRadius: BorderRadius.circular(400),
          child: Image.asset(
            "assets/images/guest.jfif",
            height: 120,
            width: 120,
          ),
        )),
        Container(
          height: 10,
        ),
        Center(
            child: Text(
          widget.user?.displayName ?? "Guest",
          style: Theme.of(context).textTheme.headlineMedium,
        )),
        FirebaseAuth.instance.currentUser != null
            ? Center(
                child: Text(
                  "Joinded in ${widget.user?.metadata.creationTime?.year}/${widget.user?.metadata.creationTime?.month}/${widget.user?.metadata.creationTime?.day} ",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              )
            : Container()
      ],
    );
  }
}
