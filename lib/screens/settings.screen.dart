import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/intern.bloc.dart';
import '../extensions/translation.dart';
import '../models/language.enum.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.palette),
          title: Text('Theme'.i18n),
          dense: true,
        ),
        BlocBuilder<InternBloc, LanguageEnum>(
          builder: (_, internState) => ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'.i18n),
            subtitle: Text(internState.fullName),
            dense: true,
          ),
        ),
      ],
    );
  }
}
