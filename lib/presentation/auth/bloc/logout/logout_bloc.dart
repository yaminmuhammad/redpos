import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redpos/data/datasource/auth_remote_datasource.dart';

part 'logout_event.dart';
part 'logout_state.dart';
part 'logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRemoteDataSource authRemoteDataSource;
  LogoutBloc(
    this.authRemoteDataSource,
  ) : super(const _Initial()) {
    on<_Logout>((event, emit) async {
      final result = await authRemoteDataSource.logout();
      result.fold(
        (error) => emit(_Error(error)),
        (success) => emit(const _Success()),
      );
    });
  }
}
