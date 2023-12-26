// ignore_for_file: non_constant_identifier_names
import 'package:login/domain/entities/login.dart';
import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  const LoginModel({
    required this.success,
    required this.pesan,
  });
  final bool success;
  final String? pesan;
  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        pesan: json["pesan"],
      );
  Map<String, dynamic> toJson() => {"success": success, "pesan": pesan};
  Login toEntity() {
    return Login(
      success: success,
      pesan: pesan.toString(),
    );
  }

  @override
  List<Object?> get props => [success, pesan];
}
