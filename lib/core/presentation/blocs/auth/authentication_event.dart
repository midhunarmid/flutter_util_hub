part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

class AuthSignInEvent extends AuthenticationEvent {
  final String email;
  final String password;

  AuthSignInEvent(this.email, this.password);
}
