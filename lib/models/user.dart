class User {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final bool isInstructor;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    this.isInstructor = false,
  });
}
