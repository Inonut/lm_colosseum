import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:lm_colosseum/models/language.enum.dart';

class Util {
  static Widget loadFlag(LanguageEnum lang) {
//    return Image.asset(
//      'assets/images/flags/${lang.asObject.countryCode.toLowerCase()}.png',
//      width: 25,
//    );
    // a better alternative with images for web
    return Flags.getMiniFlag(lang.asObject.countryCode, null, null);
  }
}
