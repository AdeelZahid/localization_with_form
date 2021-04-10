class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> listLanguage() {
    return <Language>[
      Language(1, "🇵🇰", "اردو", "ur"),
      Language(2, "🇦🇫", "فارسی", "fa"),
      Language(3, "🇺🇸", "English", "en"),
      Language(4, "🇸🇦", "اَلْعَرَبِيَّةُ‎", "ar"),
      Language(5, "🇮🇳", "हिंदी", "hi"),
    ];
  }
}
