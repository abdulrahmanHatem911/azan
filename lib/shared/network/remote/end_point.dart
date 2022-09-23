class ApiContext {
  static String BASE_URL = "https://api.aladhan.com";
  static String TIME_PRAYER =
      "/timingsByAddress/${DateTime.now().day.toString()}-${DateTime.now().month.toString()}-${DateTime.now().year.toString()}";
}
