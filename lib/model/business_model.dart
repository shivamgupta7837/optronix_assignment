class BusinessModel {
  final String name;
  final String email;
  final String address;
  final String phoneNumber;
  final String location;
  final int customerCount;
  final ContactPerson contactPerson;

  BusinessModel({
    required this.name,
    required this.email,
    required this.address,
    required this.phoneNumber,
    required this.location,
    required this.customerCount,
    required this.contactPerson,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'phoneNumber': phoneNumber,
      'location': location,
      'customerCount': customerCount,
      'contactPerson': contactPerson.toJson(),
    };
  }

  factory BusinessModel.fromJson(Map<String, dynamic> json) {
    return BusinessModel(
      name: json['name'],
      email: json['email'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      location: json['location'],
      customerCount: json['customerCount'],
      contactPerson: ContactPerson.fromJson(json['contactPerson']),
    );
  }
}

class ContactPerson {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String designation;
  final DateTime dateOfBirth;
  final String password;

  ContactPerson({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.designation,
    required this.dateOfBirth,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'designation': designation,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'password': password,
    };
  }

  factory ContactPerson.fromJson(Map<String, dynamic> json) {
    return ContactPerson(
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      designation: json['designation'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      password: json['password'],
    );
  }
}
