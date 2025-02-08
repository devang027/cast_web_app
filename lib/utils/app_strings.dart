class AppStrings {
  static const String appName = "Shiva Sand Cast";
  static const String fontMontserrat = "Montserrat";
  static const String fontElectrolize = "Electrolize";

  // Image Paths
  static final List<String> imagePaths = List.generate(
    25,
    (index) => 'assets/pd${index + 1}.jpeg',
  );

  static final List<String> imagePathsName = List.generate(
    25,
    (index) => 'Product ${index + 1}',
  );

  // Other Common Strings
  static const String welcomeMessage = "Welcome to Shiva Sand Cast!";
  static const String quote =
      "Delivering top-notch ferrous and non-ferrous castings";
  static const String errorMessage = "Something went wrong. Please try again.";
}
