import 'package:flutter_bloc/flutter_bloc.dart';

/// [ValueCubit] extension on [Cubit]
class ValueCubit<T> extends Cubit<T> {
  /// Default [ValueCubit] constructor
  ValueCubit(T initialState) : super(initialState);

  set state(T value) {
    emit(value);
  }
}
