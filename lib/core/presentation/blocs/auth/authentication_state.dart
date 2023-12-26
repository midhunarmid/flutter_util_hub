part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

class LoadingState extends AuthenticationState {
  final LoadingInfo loadingInfo;

  LoadingState(this.loadingInfo);
}

class AuthSignedInState extends AuthenticationState {
  final AuthUserModel userCredential;

  AuthSignedInState(this.userCredential);
}

class AuthErrorState extends AuthenticationState {
  final String title;
  final String message;
  final StatusInfoIconEnum icon;

  AuthErrorState(this.title, this.message, this.icon);
}
