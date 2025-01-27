class UserData {
  final String uid;
  final String email;

  UserData({
    required this.uid,
    required this.email,
  });

  factory UserData.fromMap(Map<String, dynamic> data, String documentId) {
    return UserData(
      uid: documentId,
      email: data['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
    };
  }
}
