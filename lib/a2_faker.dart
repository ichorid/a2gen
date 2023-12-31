import 'package:faker/faker.dart';

class A2Faker {
  final _now = DateTime.now();

  String genName() => faker.person.name();

  String genTitle() => faker.lorem.sentence();

  String genText() => faker.randomGenerator.boolean()
      ? faker.lorem
          .sentences(faker.randomGenerator.integer(5, min: 1))
          .join('\n')
      : '';

  String genUserId() => faker.randomGenerator.fromCharSet(
        'abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ',
        28,
      );

  int genAmount({int min = 1}) => faker.randomGenerator.integer(10, min: min);

  String? genTimerange() => faker.randomGenerator.boolean()
      ? '["$_now","${_now.add(Duration(days: genAmount()))}"]'
      : null;

  Map<String, Object>? genCoords() => faker.randomGenerator.boolean()
      ? {
          'type': 'Point',
          'coordinates': [faker.geo.latitude(), faker.geo.longitude()],
        }
      : null;
}
