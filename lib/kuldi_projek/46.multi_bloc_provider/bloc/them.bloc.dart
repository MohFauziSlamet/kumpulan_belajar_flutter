import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeMultiBloc extends Cubit<bool> {
  ThemeMultiBloc() : super(false);
  void changeTheme() => emit(!state);
}
