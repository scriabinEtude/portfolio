class Pubdev {
  final String title;
  final String preview;
  final String link;
  final PackageType type;
  final String image;

  Pubdev({
    required this.title,
    required this.preview,
    required this.link,
    required this.type,
    this.image = 'assets/images/logo_pubdev.png',
  });
}

enum PackageType {
  dart('Dart Package'),
  flutter('Flutter Package');

  final String title;
  const PackageType(this.title);
}
