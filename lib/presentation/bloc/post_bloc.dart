// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/domain/usecase/post_login.dart';
import 'package:login/domain/entities/login.dart';
import 'package:login/domain/usecase/post_logout.dart';
part 'post_event.dart';
part 'post_state.dart';

class PostLoginBloc extends Bloc<PostBlocEvent, PostBlocState> {
  final PostLogin _postLogin;
  PostLoginBloc(this._postLogin) : super(PostLoading()) {
    on<OnloginPost>((event, emit) async {
      final username = event.username;
      final password = event.password;
      emit(PostLoading());
      final result = await _postLogin.execute(username, password);
      result.fold((failure) {
        emit(PostHasError(failure.message));
      }, (login) {
        emit(PostLoginHasData(login));
      });
    });
  }
}

class PostLogoutBloc extends Bloc<PostBlocEvent, PostBlocState> {
  final PostLogout _postLogout;
  PostLogoutBloc(this._postLogout) : super(PostLoading()) {
    on<OnlogoutPost>((event, emit) async {
      emit(PostLoading());
      final result = await _postLogout.execute();
      result.fold((failure) {
        emit(PostHasError(failure.message));
      }, (success) {
        emit(const PostLogoutHasData());
      });
    });
  }
}


