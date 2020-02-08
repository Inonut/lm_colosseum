import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lm_colosseum/blocs/intern.bloc.dart';
import 'package:lm_colosseum/blocs/theme.bloc.dart';
import 'package:lm_colosseum/models/language.enum.dart';
import 'package:lm_colosseum/models/theme.enum.dart';
import 'package:lm_colosseum/widgets/circle_shape.dart';
import 'package:lm_colosseum/widgets/language_item.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../extensions/translation.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      tablet: _buildTablet(context),
      mobile: _buildMobile(context),
    );
  }

  Widget _buildTablet(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desktop'),
        actions: <Widget>[
          _actionButtonAction(languageWidget(context)),
          _actionButtonAction(themeWidget(context))
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildMobile(context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          )
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
              ),
              child: Text('Settings'.i18n),
            ),
            _actionButtonAction(languageWidget(context)),
            _actionButtonAction(themeWidget(context)),
          ],
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).primaryColorLight),
      alignment: Alignment.center,
      child: Text('Hello %s'.i18n.fill(['ಠ_ಠ']), style: Theme.of(context).textTheme.bodyText2.apply(fontSizeDelta: 10)),
    );
  }

  Widget _actionButtonAction(child) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 10),
      child: child,
    );
  }

  Widget languageWidget(context) {
    return DropdownButton(
      items: [
        DropdownMenuItem(
          child: LanguageItem(LanguageEnum.RO),
          value: LanguageEnum.RO,
        ),
        DropdownMenuItem(
          child: LanguageItem(LanguageEnum.EN),
          value: LanguageEnum.EN,
        ),
      ],
      value: BlocProvider.of<InternBloc>(context).state,
      onChanged: (val) => BlocProvider.of<InternBloc>(context).add(val),
    );
  }

  Widget themeWidget(context) {
    return DropdownButton(
      items: [
        DropdownMenuItem(
          child: CircleShape(color: Colors.white, child: CircleShape(color: ThemeEnum.BlueLight.asObject.primaryColor, r: 20)),
          value: ThemeEnum.BlueLight,
        ),
        DropdownMenuItem(
          child: CircleShape(color: Colors.white, child: CircleShape(color: ThemeEnum.GreenLight.asObject.primaryColor, r: 20)),
          value: ThemeEnum.GreenLight,
        ),
      ],
      value: BlocProvider.of<ThemeBloc>(context).state,
      onChanged: (val) => BlocProvider.of<ThemeBloc>(context).add(val),
    );
  }
}
