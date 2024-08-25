import 'package:flutter/material.dart';
import 'package:nota/utils/constants/styles.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: containerPadding,
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: 20.0,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              Text(
                'About Nota',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Nota is a simple note taking app that is designed to be fast and easy to use. It is built with Flutter and uses Hive for local storage and firebase for cloud storage. The source code is available on GitHub.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                'Developed by: Mortdha',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Wrap(runSpacing: 10.0, children: [
                Text(
                  'Version: 2.0.0',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'Copyright 2022 Al-Mustafa. All rights reserved.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
