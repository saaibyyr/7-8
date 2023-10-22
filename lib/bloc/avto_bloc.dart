import 'dart:async';
import 'package:flutter_formreg_aierke/bloc/avto_event.dart';
import 'package:flutter_formreg_aierke/bloc/avto_state.dart';
import 'package:flutter_formreg_aierke/main.dart';

class AvtoBloc {
  final _stateController = StreamController<AvtoState>();

  Stream<AvtoState> get state => _stateController.stream;

  void dispatch(AvtoEvent event) {
    if (event is PostUserDetailsEvent) {
      _postUserDetails(event.user);
    }
  }

  _postUserDetails(NewUser user) async {
    _stateController.add(LoadingState());

    await Future.delayed(Duration(seconds: 2));

    _stateController.add(SuccessState());
  }

  void dispose() {
    _stateController.close();
  }
}
