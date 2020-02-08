import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:lm_colosseum/models/language.enum.dart';

class LanguageItem extends StatelessWidget {
  final LanguageEnum lang;

  LanguageItem(this.lang);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flags.getMiniFlag(lang.asObject.countryCode, null, null),
        SizedBox(
          width: 10,
        ),
        Text(lang.fullName)
      ],
    );
  }
}
