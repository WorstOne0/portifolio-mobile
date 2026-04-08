import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 'pt' or 'en'
final languageProvider = StateProvider<String>((ref) => 'pt');
