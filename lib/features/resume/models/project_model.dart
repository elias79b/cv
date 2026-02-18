class ProjectModel {
  final String titleKey;
  final String descriptionKey;
  final String imagePath;
  final String? githubUrl;
  final String? storeUrl;
  final List<String> tech;

  const ProjectModel({
    required this.titleKey,
    required this.descriptionKey,
    required this.imagePath,
    this.githubUrl,
    this.storeUrl,
    required this.tech,
  });
}
