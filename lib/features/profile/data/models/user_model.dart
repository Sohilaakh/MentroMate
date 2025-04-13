class UserModel {
  final String uid;
  final String firstName;
  final String lastName;
  final String email;
  final String faculty;
  final String major;
  final String gender;
  final String phoneNumber;
  final String graduationYear;
  final String graduationStatus;
  final String profileImage; // ✅ جديد

  UserModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.faculty,
    required this.major,
    required this.gender,
    required this.phoneNumber,
    required this.graduationYear,
    required this.graduationStatus,
    this.profileImage = '', // ✅ default value
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'faculty': faculty,
      'major': major,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'graduationYear': graduationYear,
      'graduationStatus': graduationStatus,
      'profileImage': profileImage,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      faculty: map['faculty'] ?? '',
      major: map['major'] ?? '',
      gender: map['gender'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      graduationYear: map['graduationYear'] ?? '',
      graduationStatus: map['graduationStatus'] ?? '',
      profileImage: map['profileImage'] ?? '', // ✅ هنا
    );
  }
}
