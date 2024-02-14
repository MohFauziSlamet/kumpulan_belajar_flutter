import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(true);

  ///* mengubah status theme
  void onChangeTheme() => emit(!state);

  @override
  void onChange(Change<bool> change) {
    super.onChange(change);
    log("message onChange : $change ");
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    log("message onChange : $error || stackTrace : $stackTrace ");
  }
}
