class UserModel {
  final String name;
  final String phone;
  final String department;
  final String academicyear;
  final String email;
  final String status;

  UserModel({
    required this.name,
    required this.phone,
    required this.department,
    required this.academicyear,
    required this.email,
    required this.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? 'Unknown',
      email: json['email'] ?? '',
      department: json['department'] ?? '',
      phone: json['phone'] ?? '',
      academicyear: json['academic_year'] ?? '',
      status: json['status'] ?? '',
    );
  }
}
