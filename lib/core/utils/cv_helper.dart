String getCvPath(String langCode) {
  switch (langCode) {
    case 'fa':
      return 'assets/cv/cv_fa.pdf';
    case 'de':
      return 'assets/cv/cv_de.pdf';
    case 'fr':
      return 'assets/cv/cv_fr.pdf';
    case 'es':
      return 'assets/cv/cv_es.pdf';
    case 'it':
      return 'assets/cv/cv_it.pdf';
    case 'ar':
      return 'assets/cv/cv_ar.pdf';
    case 'en':
    default:
      return 'assets/cv/cv_en.pdf';
  }
}
