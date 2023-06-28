class DummyData {
  const DummyData({
    this.name = 'any',
    this.username = 'any',
    this.userprofilepix = 'any',
    this.postedpix = 'any',
  });

  final String name;
  final String username;
  final String userprofilepix;
  final String postedpix;
}

final List<DummyData> posts = <DummyData>[
  const DummyData(
      name: 'max',
      username: '@maxxy',
      userprofilepix:
          'https://source.unsplash.com/random/?wildlife&width=50&height=1000',
      postedpix:
          'https://source.unsplash.com/random/?wildlife&width=50&height=1000'),
  const DummyData(
    name: 'david',
    username: '@braddygot',
    userprofilepix:
        'https://source.unsplash.com/random/?wildlife&width=500&height=1000',
    postedpix:
        'https://source.unsplash.com/random/?wildlife&width=503&height=1000',
  ),
  const DummyData(
      name: 'max',
      username: '@maxxy',
      userprofilepix:
          'https://source.unsplash.com/random/?wildlife&width=500&height=1000',
      postedpix:
          'https://source.unsplash.com/random/?wildlife&width=505&height=1000'),
  const DummyData(
      name: 'max',
      username: '@maxxy',
      userprofilepix:
          'https://source.unsplash.com/random/?wildlife&width=500&height=1000',
      postedpix:
          'https://source.unsplash.com/random/?wildlife&width=560&height=1000'),
  const DummyData(
      name: 'max',
      username: '@maxxy',
      userprofilepix:
          'https://source.unsplash.com/random/?wildlife&width=500&height=1000',
      postedpix:
          'https://source.unsplash.com/random/?wildlife&width=570&height=1000'),
];
