// lib/theme_service.dart
import 'package:flutter/material.dart';

// Global notifier to hold the current ThemeMode.
// Default to light; change to ThemeMode.dark if you want dark as default.
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);
