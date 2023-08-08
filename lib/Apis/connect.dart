import 'package:upstash_redis/upstash_redis.dart';

connect() async {
  final redis = Redis(
      url: "https://feasible-drum-45096.upstash.io",
      token:
          "AbAoASQgZmVlNDA0MzgtNDJmNi00YmIxLTkzMzUtMjcxNThkMWNmZWEyYjJhNDIzYzQzOGYxNDE0NDk5OTU4NGFhMjIyY2I4ZTk=");
  return redis;
}

final redis = connect();
