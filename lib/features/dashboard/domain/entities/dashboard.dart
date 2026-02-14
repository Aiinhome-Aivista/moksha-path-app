import 'package:equatable/equatable.dart';

class Dashboard extends Equatable {
  final int id;

  const Dashboard({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
