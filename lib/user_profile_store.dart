import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile {
  const UserProfile({
    required this.fullName,
    required this.email,
    required this.password,
  });

  final String fullName;
  final String email;
  final String password;

  UserProfile copyWith({
    String? fullName,
    String? email,
    String? password,
  }) {
    return UserProfile(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

final ValueNotifier<UserProfile> currentUser = ValueNotifier<UserProfile>(
  const UserProfile(
    fullName: '',
    email: '',
    password: '',
  ),
);

const String _fullNameKey = 'user_full_name';
const String _emailKey = 'user_email';
const String _passwordKey = 'user_password';

bool get hasRegisteredUser {
  final UserProfile user = currentUser.value;
  return user.fullName.trim().isNotEmpty &&
      user.email.trim().isNotEmpty &&
      user.password.isNotEmpty;
}

Future<void> loadStoredUserProfile() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  currentUser.value = UserProfile(
    fullName: prefs.getString(_fullNameKey) ?? '',
    email: prefs.getString(_emailKey) ?? '',
    password: prefs.getString(_passwordKey) ?? '',
  );
}

Future<void> saveUserProfile(UserProfile profile) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(_fullNameKey, profile.fullName);
  await prefs.setString(_emailKey, profile.email);
  await prefs.setString(_passwordKey, profile.password);
  currentUser.value = profile;
}
