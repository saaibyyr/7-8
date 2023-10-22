import 'package:flutter_formreg_aierke/main.dart';

abstract class AvtoEvent {}

class PostUserDetailsEvent extends AvtoEvent {
  final NewUser user;

  PostUserDetailsEvent(this.user);
}
