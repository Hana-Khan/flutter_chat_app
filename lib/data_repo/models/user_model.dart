import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  /// {@macro user}
  const MyUser({
    required this.id,
    this.email,
    this.name,
  });

  final String? email;

  final String id;

  final String? name;

  static const empty = MyUser(id: '');

  bool get isEmpty => this == MyUser.empty;

  bool get isNotEmpty => this != MyUser.empty;

  @override
  List<Object?> get props => [email, id, name];
}
