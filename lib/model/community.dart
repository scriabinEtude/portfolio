class Community {
  final String title;
  final String? url;
  final String imagePath;

  Community({
    required this.title,
    required this.url,
    required this.imagePath,
  });

  bool get isUrl => url != null;
}
