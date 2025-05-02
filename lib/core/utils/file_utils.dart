String generateCleanFileName(
    {String prefix = 'student', String extension = 'jpg'}) {
  final now = DateTime.now();
  final formattedDate =
      '${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}_${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}${now.second.toString().padLeft(2, '0')}';
  return '${prefix}_$formattedDate.$extension';
}
