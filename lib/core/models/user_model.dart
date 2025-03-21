class UserModel {
  final String name;
  final String id;
  final String department;
  final String academicLevel;
  final String email;
  final String status;

  UserModel({
    required this.name,
    required this.id,
    required this.department,
    required this.academicLevel,
    required this.email,
    required this.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      id: json['id'] ?? '',
      department: json['department'] ?? '',
      academicLevel: json['academic_level'] ?? '',
      email: json['email'] ?? '',
      status: json['status'] ?? '',
    );
  }
}
