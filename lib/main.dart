import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app_theme.dart';
import 'screens/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://vzdqgjbycgxcwshqqflk.supabase.co',
    publishableKey: 'sb_publishable_8p0e5gwCJKEbA1hXUsBHtA_EN7DoeVn',
  );

  runApp(const MacallinApp());
}

class MacallinApp extends StatelessWidget {
  const MacallinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Macallin',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const WelcomeScreen(),
    );
  }
}
