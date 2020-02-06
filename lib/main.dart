import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lm_colosseum/models/language.enum.dart';
import 'package:lm_colosseum/models/route.enum.dart';
import 'package:lm_colosseum/models/theme.enum.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'blocs/intern.bloc.dart';
import 'blocs/theme.bloc.dart';
import 'route.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(),
        ),
        BlocProvider<InternBloc>(
          create: (BuildContext context) => InternBloc(),
        ),
      ],
      child: BlocBuilder<InternBloc, LanguageEnum>(
        builder: (_, internState) => BlocBuilder<ThemeBloc, ThemeEnum>(
          builder: (_, themeState) => _buildApp(internState.asObject, themeState.asObject),
        ),
      ),
    );
  }

  Widget _buildApp(locale, theme) {
    return MaterialApp(
      title: 'Colosseum',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        LanguageEnum.EN.asObject,
        LanguageEnum.RO.asObject,
      ],
      theme: theme,
      locale: locale,
      builder: (context, child) => child,
      home: ScreenTypeLayout(
        mobile: Navigator(
          onGenerateRoute: generateRouteMobile,
          initialRoute: RouteEnum.Home.route,
        ),
        tablet: Navigator(
          onGenerateRoute: generateRouteTablet,
          initialRoute: RouteEnum.Home.route,
        ),
        desktop:Navigator(
          onGenerateRoute: generateRouteTablet,
          initialRoute: RouteEnum.Home.route,
        ),
      ),
    );
  }
}