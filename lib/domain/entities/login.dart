// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Login extends Equatable {
  Login({
    required this.success,
    required this.pesan,
  });
  bool success;
  String pesan;
  @override
  List<Object?> get props => [success, pesan];
}
