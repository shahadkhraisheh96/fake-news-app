import 'package:flutter/material.dart';

// This is a simple implementation for app localization
// For a production app, consider using flutter_localizations and intl packages

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  // Helper method to keep the code in the widgets concise
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  // Static member to have access to the delegate from the MaterialApp
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  // Simple translations
  // In a real app, you'd load these from JSON files or a database
  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'News App',
      'welcome': 'Welcome to News App',
      'search': 'Search for news...',
      'chatbot': 'News Assistant',
      'results': 'Search Results',
      'history': 'Search History',
      'login': 'Sign In',
      'signup': 'Sign Up',
      'settings': 'Settings',
      'contact': 'Contact Us',
      'darkMode': 'Dark Mode',
      'language': 'Language',
      'email': 'Email',
      'password': 'Password',
      'forgotPassword': 'Forgot password?',
      'noAccount': 'Don\'t have an account?',
      'haveAccount': 'Already have an account?',
      'clearHistory': 'Clear Search History',
      'noHistory': 'No search history',
    },
    'ar': {
      'appTitle': 'تطبيق الأخبار',
      'welcome': 'مرحبًا بك في تطبيق الأخبار',
      'search': 'ابحث عن الأخبار...',
      'chatbot': 'مساعد الأخبار',
      'results': 'نتائج البحث',
      'history': 'سجل البحث',
      'login': 'تسجيل الدخول',
      'signup': 'إنشاء حساب',
      'settings': 'الإعدادات',
      'contact': 'اتصل بنا',
      'darkMode': 'الوضع الداكن',
      'language': 'اللغة',
      'email': 'البريد الإلكتروني',
      'password': 'كلمة المرور',
      'forgotPassword': 'نسيت كلمة المرور؟',
      'noAccount': 'ليس لديك حساب؟',
      'haveAccount': 'لديك حساب بالفعل؟',
      'clearHistory': 'مسح سجل البحث',
      'noHistory': 'لا يوجد سجل بحث',
    },
    'fr': {
      'appTitle': 'Application d\'actualités',
      'welcome': 'Bienvenue sur l\'Application d\'actualités',
      'search': 'Rechercher des actualités...',
      'chatbot': 'Assistant d\'actualités',
      'results': 'Résultats de recherche',
      'history': 'Historique de recherche',
      'login': 'Se connecter',
      'signup': 'S\'inscrire',
      'settings': 'Paramètres',
      'contact': 'Contactez-nous',
      'darkMode': 'Mode sombre',
      'language': 'Langue',
      'email': 'Email',
      'password': 'Mot de passe',
      'forgotPassword': 'Mot de passe oublié ?',
      'noAccount': 'Vous n\'avez pas de compte ?',
      'haveAccount': 'Vous avez déjà un compte ?',
      'clearHistory': 'Effacer l\'historique de recherche',
      'noHistory': 'Aucun historique de recherche',
    },
    'es': {
      'appTitle': 'Aplicación de Noticias',
      'welcome': 'Bienvenido a la Aplicación de Noticias',
      'search': 'Buscar noticias...',
      'chatbot': 'Asistente de Noticias',
      'results': 'Resultados de búsqueda',
      'history': 'Historial de búsqueda',
      'login': 'Iniciar sesión',
      'signup': 'Registrarse',
      'settings': 'Configuración',
      'contact': 'Contáctenos',
      'darkMode': 'Modo oscuro',
      'language': 'Idioma',
      'email': 'Correo electrónico',
      'password': 'Contraseña',
      'forgotPassword': '¿Olvidó su contraseña?',
      'noAccount': '¿No tiene una cuenta?',
      'haveAccount': '¿Ya tiene una cuenta?',
      'clearHistory': 'Borrar historial de búsqueda',
      'noHistory': 'Sin historial de búsqueda',
    },
  };

  String get appTitle {
    return _localizedValues[locale.languageCode]?['appTitle'] ?? 'News App';
  }

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? 
           _localizedValues['en']?[key] ?? 
           key;
  }
}

// LocalizationsDelegate is a factory for a set of localized resources
class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar', 'fr', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}