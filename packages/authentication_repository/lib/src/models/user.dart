import 'package:equatable/equatable.dart';

/// {@template user}
/// User Model
///
/// [User.empty] represents an unauthenticated user.
/// {@endtemplate}

class User extends Equatable {
  const User({
    required this.id,
    this.email,
    this.name,
    this.photo
  });

  final String? email;
  final String id;
  final String? name;
  final String? photo; // Url for the current user's photo

  // Empty user which represents an unauthenticated user
  static const empty = User(id: '');
  /// It's useful to define a static empty User so that I don't have to handle
  /// null Users and can always work with a concrete User object

  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [email, id, name, photo];
}