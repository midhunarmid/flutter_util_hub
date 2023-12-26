import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_util_hub/core/data/models/auth_user_model.dart';
import 'package:flutter_util_hub/core/data/models/plain_response_model.dart';
import 'package:flutter_util_hub/core/domain/usecases/authentication.dart';
import 'package:flutter_util_hub/core/presentation/utils/constants.dart';
import 'package:flutter_util_hub/core/presentation/utils/message_generator.dart';
import 'package:flutter_util_hub/core/presentation/utils/my_app_exception.dart';
import 'package:get_it/get_it.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      try {
        appLogger.i(event);
        if (event is AuthSignInEvent) {
          emit.call(
            LoadingState(
              LoadingInfo(
                icon: LoadingIconEnum.submitting,
                title: MessageGenerator.getLabel("Signing In"),
                message: MessageGenerator.getMessage(
                    "Please wait while we sign in to the system."),
              ),
            ),
          );

          AuthenticationUseCase getUserProfileUseCase =
              GetIt.instance<AuthenticationUseCase>();

          AuthUserModel authUserModel = await getUserProfileUseCase
              .authenticateUser(event.email, event.password);
          await delayedEmit(emit, AuthSignedInState(authUserModel));
        }
      } on MyAppException catch (ae) {
        appLogger.e(ae);
        await delayedEmit(
          emit,
          AuthErrorState(
            MessageGenerator.getMessage(ae.title),
            MessageGenerator.getMessage(ae.message),
            StatusInfoIconEnum.error,
          ),
        );
      } catch (e) {
        appLogger.e(e);
        await delayedEmit(
          emit,
          AuthErrorState(
            MessageGenerator.getMessage("un-expected-error"),
            MessageGenerator.getMessage("un-expected-error-message"),
            StatusInfoIconEnum.error,
          ),
        );
      }
    });
  }

  Future<void> delayedEmit(
      Emitter<AuthenticationState> emitter, AuthenticationState state) async {
    await Future.delayed(const Duration(milliseconds: 500));
    emitter.call(state);
  }
}
