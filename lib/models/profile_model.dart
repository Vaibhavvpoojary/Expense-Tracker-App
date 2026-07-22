class ProfileModel {
  final int? id;
  final String name;
  final int age;
  final String occupation;
  final double income;
  final String currency;

  ProfileModel({
    this.id,
    required this.name,
    required this.age,
    required this.occupation,
    required this.income,
    required this.currency,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'occupation': occupation,
      'income': income,
      'currency': currency,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'],
      name: map['name'],
      age: map['age'],
      occupation: map['occupation'],
      income: (map['income'] as num).toDouble(),
      currency: map['currency'],
    );
  }
}