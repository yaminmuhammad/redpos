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
  ) : super(_Initial()) {
    on<LogoutEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
