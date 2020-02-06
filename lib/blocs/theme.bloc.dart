import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lm_colosseum/models/theme.enum.dart';

class ThemeBloc extends Bloc<ThemeEnum, ThemeEnum> {
  @override
  ThemeEnum get initialState => ThemeEnum.GreenLight;

  @override
  Stream<ThemeEnum> mapEventToState(ThemeEnum event) async* {
    yield event;
  }
}