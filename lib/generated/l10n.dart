// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Access`
  String get subscription_access {
    return Intl.message(
      'Access',
      name: 'subscription_access',
      desc: '',
      args: [],
    );
  }

  /// `10+ guided meditations sessions`
  String get subscription_subscription1 {
    return Intl.message(
      '10+ guided meditations sessions',
      name: 'subscription_subscription1',
      desc: '',
      args: [],
    );
  }

  /// `Mood tracking over time`
  String get subscription_subscription2 {
    return Intl.message(
      'Mood tracking over time',
      name: 'subscription_subscription2',
      desc: '',
      args: [],
    );
  }

  /// `New meditations added weekly`
  String get subscription_subscription3 {
    return Intl.message(
      'New meditations added weekly',
      name: 'subscription_subscription3',
      desc: '',
      args: [],
    );
  }

  /// `Relevant articles curated daily`
  String get subscription_subscription4 {
    return Intl.message(
      'Relevant articles curated daily',
      name: 'subscription_subscription4',
      desc: '',
      args: [],
    );
  }

  /// `Another Important offering here!`
  String get subscription_subscription5 {
    return Intl.message(
      'Another Important offering here!',
      name: 'subscription_subscription5',
      desc: '',
      args: [],
    );
  }

  /// `Try 7 days for free`
  String get subscription_freeTrial {
    return Intl.message(
      'Try 7 days for free',
      name: 'subscription_freeTrial',
      desc: '',
      args: [],
    );
  }

  /// `$00.00/month billed annually`
  String get subscription_annualBillAmount {
    return Intl.message(
      '\$00.00/month billed annually',
      name: 'subscription_annualBillAmount',
      desc: '',
      args: [],
    );
  }

  /// `By using the twoplus app you agree to our`
  String get subscription_policy1 {
    return Intl.message(
      'By using the twoplus app you agree to our',
      name: 'subscription_policy1',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy `
  String get subscription_policy2 {
    return Intl.message(
      'Privacy Policy ',
      name: 'subscription_policy2',
      desc: '',
      args: [],
    );
  }

  /// ` Terms and Conditions`
  String get subscription_policy3 {
    return Intl.message(
      ' Terms and Conditions',
      name: 'subscription_policy3',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get common_and {
    return Intl.message(
      'and',
      name: 'common_and',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning, Name`
  String get home_goodMorning {
    return Intl.message(
      'Good Morning, Name',
      name: 'home_goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `'How are \n you feeling?'`
  String get home_aboutFeeling {
    return Intl.message(
      '\'How are \n you feeling?\'',
      name: 'home_aboutFeeling',
      desc: '',
      args: [],
    );
  }

  /// `1 min check-in`
  String get home_checkIn {
    return Intl.message(
      '1 min check-in',
      name: 'home_checkIn',
      desc: '',
      args: [],
    );
  }

  /// `We think you'll like`
  String get home_feedbackQuestion {
    return Intl.message(
      'We think you\'ll like',
      name: 'home_feedbackQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Meditations`
  String get home_meditation {
    return Intl.message(
      'Meditations',
      name: 'home_meditation',
      desc: '',
      args: [],
    );
  }

  /// `Find the perfect meditation`
  String get home_meditationTitle {
    return Intl.message(
      'Find the perfect meditation',
      name: 'home_meditationTitle',
      desc: '',
      args: [],
    );
  }

  /// `mins of`
  String get home_meditationPlayerTime {
    return Intl.message(
      'mins of',
      name: 'home_meditationPlayerTime',
      desc: '',
      args: [],
    );
  }

  /// `minutes of`
  String get meditation_meditationPlayerTime {
    return Intl.message(
      'minutes of',
      name: 'meditation_meditationPlayerTime',
      desc: '',
      args: [],
    );
  }

  /// `Play Session`
  String get meditationPlayer_playSession {
    return Intl.message(
      'Play Session',
      name: 'meditationPlayer_playSession',
      desc: '',
      args: [],
    );
  }

  /// `Product not available`
  String get appPurchase_notAvailable {
    return Intl.message(
      'Product not available',
      name: 'appPurchase_notAvailable',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}