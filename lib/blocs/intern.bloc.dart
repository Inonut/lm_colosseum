import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i18n_extension/i18n_widget.dart';

import '../models/language.enum.dart';

class InternBloc extends Bloc<LanguageEnum, LanguageEnum> {
  @override
  LanguageEnum get initialState {
    I18n.define(LanguageEnum.RO.asObject);
    return LanguageEnum.RO;
  }

  @override
  Stream<LanguageEnum> mapEventToState(LanguageEnum event) async* {
    I18n.define(event.asObject);
    yield event;
  }
}