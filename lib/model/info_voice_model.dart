class InfoVoice {
  final String ccbaMnm1; // 국가유산명
  final String voiceUrl; // 나레이션URL

  InfoVoice({
    // json
    required this.ccbaMnm1,
    required this.voiceUrl,
  });

  factory InfoVoice.fromJson(Map<String, dynamic> json) {
    return InfoVoice(
      ccbaMnm1: json['ccbaMnm1'],
      voiceUrl: json['voiceUrl'],
    );
  }
}