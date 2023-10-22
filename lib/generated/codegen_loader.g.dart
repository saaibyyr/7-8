// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en = {
    "Register": "Register",
    "name": "Full Name",
    "phone": "Phone Number",
    "mail": "Mail",
    "life": "Tell about you",
    "country": "Country",
    "password": "Password",
    "rec": "Password",
  };
  static const Map<String, dynamic> kk = {
    "Register": "Тіркелу",
    "name": "Аты жөні",
    "phone": "Телефон нөмірі",
    "mail": "Электрон поштасы",
    "life": "Өзіңіз туралы",
    "country": "Ел",
    "password": "Құпия сөз",
    "rec": "Құпия сөз",
  };
  static const Map<String, dynamic> ru = {
    "Register": "Зарегистрироваться",
    "name": "ФИО",
    "phone": "Номер телефона",
    "mail": "Электронная почта",
    "life": "Рассказ о себе",
    "country": "Страна",
    "password": "Пароль",
    "rec": "Повторить пароль",
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en": en,
    "kk": kk,
    "ru": ru
  };
}
