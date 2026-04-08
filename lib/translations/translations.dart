import 'en.dart';
import 'pt.dart';

export 'en.dart';
export 'pt.dart';

abstract final class AppTranslations {
  static Map<String, dynamic> get(String lang) {
    return lang == 'en' ? enTranslations : ptTranslations;
  }
}
