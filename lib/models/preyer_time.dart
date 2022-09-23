class PrayerTimes {
  final String Fajr;
  final String Sunrise;
  final String Dhuhr;
  final String Asr;
  final String Maghrib;
  final String Isha;
  PrayerTimes({
    required this.Fajr,
    required this.Sunrise,
    required this.Dhuhr,
    required this.Asr,
    required this.Maghrib,
    required this.Isha,
  });
  factory PrayerTimes.fromJson(Map<String, dynamic> json) {
    return PrayerTimes(
      Fajr: json['Fajr'],
      Sunrise: json['Sunrise'],
      Dhuhr: json['Dhuhr'],
      Asr: json['Asr'],
      Maghrib: json['Maghrib'],
      Isha: json['Isha'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'Fajr': Fajr,
      'Sunrise': Sunrise,
      'Dhuhr': Dhuhr,
      'Asr': Asr,
      'Maghrib': Maghrib,
      'Isha': Isha,
    };
  }
}
