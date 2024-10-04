part of 'models.dart';

class UserAuthentication extends Equatable {
  const UserAuthentication({
    required this.token,
    this.refresh,
  });

  final String token;
  final String? refresh;

  static const empty = UserAuthentication(token: "");

  bool get isEmpty => this == UserAuthentication.empty;

  bool get isNotEmpty => this != UserAuthentication.empty;

  factory UserAuthentication.fromJson(Map<String, dynamic> json) => UserAuthentication(
        token: json["token"],
        refresh: json["refresh"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "refresh": refresh,
      };

  @override
  List<Object?> get props => [token, refresh];
}
