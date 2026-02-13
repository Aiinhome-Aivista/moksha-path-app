import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  final int id;

  const UserProfile({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
