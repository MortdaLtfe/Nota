import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/backup/controller/backup_controller.dart';
import 'package:nota/features/backup/cubit/backup_cubit.dart';
import 'package:nota/utils/constants/colors.dart';
import 'package:nota/utils/constants/styles.dart';

class BackupView extends StatefulWidget {
  const BackupView({super.key});

  @override
  State<BackupView> createState() => _BackupViewState();
}

class _BackupViewState extends State<BackupView> {
  late BackupController backupController;
  @override
  void initState() {
    super.initState();
    backupController = BackupController(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: containerPadding,
          child: SingleChildScrollView(
            child: Wrap(runSpacing: 30.0, children: [
              Wrap(
                runSpacing: 10.0,
                children: [
                  Text(
                    "Tap this button to create a backup of your notes. The backup will be stored on The Database and can be used to restore your notes in case you lose them.",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  BlocBuilder<BackupCubit, BackupState>(
                      builder: (context, state) {
                    if (state is BackupLoading || state is RestoreLoading) {
                      return ElevatedButton(
                          onPressed: () {},
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                          ));
                    }
                    return ElevatedButton(
                        onPressed: backupController.backup,
                        child: Text(
                          "Backup",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ));
                  })
                ],
              ),
              Wrap(runSpacing: 10.0, children: [
                Text(
                  "Tap this button to restore your notes from a backup. Make sure you have already created a backup before tapping this button.",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                BlocBuilder<BackupCubit, BackupState>(
                  builder: (context, state) {
                    if (state is BackupLoading || state is RestoreLoading) {
                      return ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(sageGreen)),
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                          ));
                    }
                    return ElevatedButton(
                        onPressed: backupController.restore,
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(sageGreen)),
                        child: Text(
                          "Restore",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ));
                  },
                )
              ])
            ]),
          ),
        ));
  }
}
