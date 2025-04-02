import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales = [
    Locale('en', ''), // English
    Locale('es', ''), // Spanish
    Locale('fr', ''), // French
    Locale('hi', ''), // Hindi
  ];

  late final Map<String, Map<String, String>> _localizedStrings = {
    'en': {
      'signInTitle': 'Sign in to your account',
      'viewWishlist': 'View your wish list',
      'findReorder': 'Find & reorder past purchases',
      'trackPurchases': 'Track your purchases',
      'signInButton': 'Already a customer? Sign in',
      'createAccountButton': 'New to Amazon? Create an account',
      'skipSignInButton': 'Skip sign in',
      'signInOrCreateAccount': 'Sign in or create account',
      'enterEmail': 'Enter email',
      'enterPassword': 'Enter password',
      'continueButton': 'Continue',
      'agreeToTerms': 'By continuing, you agree to Amazon\'s ',
      'conditionsOfUse': 'Conditions of Use',
      'privacyNotice': 'Privacy Notice',
      'and': 'and',
      'help': 'Help',
      'footerText': '© 1996-2021, Amazon.com, Inc. or its affiliates',
    },
    'es': {
      'signInTitle': 'Inicia sesión en tu cuenta',
      'viewWishlist': 'Ver tu lista de deseos',
      'findReorder': 'Encontrar y volver a pedir compras anteriores',
      'trackPurchases': 'Rastrear tus compras',
      'signInButton': '¿Ya eres cliente? Inicia sesión',
      'createAccountButton': '¿Nuevo en Amazon? Crear una cuenta',
      'skipSignInButton': 'Omitir inicio de sesión',
    },
    'fr': {
      'signInTitle': 'Connectez-vous à votre compte',
      'viewWishlist': 'Voir votre liste de souhaits',
      'findReorder': 'Trouver et recommander des achats précédents',
      'trackPurchases': 'Suivre vos achats',
      'signInButton': 'Déjà client ? Connectez-vous',
      'createAccountButton': 'Nouveau sur Amazon ? Créer un compte',
      'skipSignInButton': 'Ignorer la connexion',
    },
    'hi': {
      'signInTitle': 'अपने खाते में साइन इन करें',
      'viewWishlist': 'अपनी विशलिस्ट देखें',
      'findReorder': 'पिछले खरीदारी को खोजें और फिर से ऑर्डर करें',
      'trackPurchases': 'अपनी खरीदारी को ट्रैक करें',
      'signInButton': 'पहले से ग्राहक हैं? साइन इन करें',
      'createAccountButton': 'Amazon पर नए हैं? खाता बनाएं',
      'skipSignInButton': 'साइन इन छोड़ें',
    },
  };

  String get signInTitle =>
      _localizedStrings[locale.languageCode]!['signInTitle']!;
  String get viewWishlist =>
      _localizedStrings[locale.languageCode]!['viewWishlist']!;
  String get findReorder =>
      _localizedStrings[locale.languageCode]!['findReorder']!;
  String get trackPurchases =>
      _localizedStrings[locale.languageCode]!['trackPurchases']!;
  String get signInButton =>
      _localizedStrings[locale.languageCode]!['signInButton']!;
  String get createAccountButton =>
      _localizedStrings[locale.languageCode]!['createAccountButton']!;
  String get skipSignInButton =>
      _localizedStrings[locale.languageCode]!['skipSignInButton']!;
  String get signInOrCreateAccount =>
      _localizedStrings[locale.languageCode]!['signInOrCreateAccount']!;
  String get enterEmail =>
      _localizedStrings[locale.languageCode]!['enterEmail']!;
  String get enterPassword =>
      _localizedStrings[locale.languageCode]!['enterPassword']!;
  String get continueButton =>
      _localizedStrings[locale.languageCode]!['continueButton']!;
  String get agreeToTerms =>
      _localizedStrings[locale.languageCode]!['agreeToTerms']!;
  String get conditionsOfUse =>
      _localizedStrings[locale.languageCode]!['conditionsOfUse']!;
  String get privacyNotice =>
      _localizedStrings[locale.languageCode]!['privacyNotice']!;
  String get and => _localizedStrings[locale.languageCode]!['and']!;
  String get help => _localizedStrings[locale.languageCode]!['help']!;
  String get footerText =>
      _localizedStrings[locale.languageCode]!['footerText']!;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es', 'fr', 'hi'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
