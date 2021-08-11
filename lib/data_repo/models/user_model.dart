import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  /// {@macro user}
  const MyUser(
      {required this.id,
      this.email,
      this.name,
      this.about,
      this.contactNumber,
      this.gender});

  final String? email;

  final String id;

  final String? name;

  final String? gender;
  final String? contactNumber;
  final String? about;

  @override
  List<Object?> get props => [email, id, name, contactNumber, gender, about];
}
