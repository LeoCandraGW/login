part of 'post_bloc.dart';

abstract class PostBlocState extends Equatable {
  const PostBlocState();

  @override
  List<Object> get props => [];
}

class PostEmpty extends PostBlocState {}

class PostLoading extends PostBlocState {}

class PostLoginHasData extends PostBlocState {
  final Login login;

  const PostLoginHasData(this.login);

  @override
  List<Object> get props => [login];
}

class PostLogoutHasData extends PostBlocState {
  const PostLogoutHasData();

  @override
  List<Object> get props => [];
}

class PostHasError extends PostBlocState {
  final String message;
  const PostHasError(this.message);

  @override
  List<Object> get props => [message];
}
