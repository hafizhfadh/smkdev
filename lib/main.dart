// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:smkdev/utils/routers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://ksqmfufktupuoeqiubnm.supabase.co',
    anonKey: const String.fromEnvironment('SECRET_KEY'),
  );

  runApp(FoodApp());
}

class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Food App',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,onBackground: Colors.pink),
        useMaterial3: true,
      ),
    );
  }
}
