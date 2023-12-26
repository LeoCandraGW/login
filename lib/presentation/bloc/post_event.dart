// ignore_for_file: non_constant_identifier_names
part of 'post_bloc.dart';

abstract class PostBlocEvent extends Equatable {
  const PostBlocEvent();
  @override
  List<Object> get props => [];
}

class OnloginPost extends PostBlocEvent {
  final String username;
  final String password;
  const OnloginPost(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}

class OnlogoutPost extends PostBlocEvent {
  const OnlogoutPost();

  @override
  List<Object> get props => [];
}
