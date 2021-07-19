class User {
  final String login;
  final String name;
  final String lastName;
  final String phoneNumber;
  final String password;
  final String? dr;
  final String? program;
  final int? cardNumber;

  User(
      {required this.login,
      required this.name,
      required this.lastName,
      required this.password,
      required this.phoneNumber,
      this.dr = '',
      this.program = '',
      this.cardNumber = 000000});

  User copy(
          {String? login,
          String? name,
          String? lastName,
          String? password,
          String? phoneNumber,
          String? dr,
          String? program,
          int? cardNumber}) =>
      User(
        login: login ?? this.login,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        password: password ?? this.password,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        dr: dr ?? this.dr,
        program: program ?? this.program,
        cardNumber: cardNumber ?? this.cardNumber,
      );

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      login: json['login'],
      name: json['name'],
      lastName: json['lastName'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      dr: json['dr'],
      program: json['program'],
      cardNumber: json['cardNumber'],
    );
  }

  Map toMap() {
    return {
      'login': login,
      'name': name,
      'lastName': lastName,
      'password': password,
      'phoneNumber': phoneNumber,
      'dr': dr ?? '',
      'program': program ?? '',
      'cardNumber': cardNumber ?? 000000,
    };
  }
}
