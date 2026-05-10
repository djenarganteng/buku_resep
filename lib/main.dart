import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'bookmark_store.dart';
import 'login_page.dart';
import 'user_profile_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadStoredUserProfile();
  await loadStoredBookmarks();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rasa Nusantara',
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
    );
  }
}
