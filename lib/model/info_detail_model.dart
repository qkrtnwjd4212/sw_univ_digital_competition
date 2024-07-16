class InfoDetail {
  final String ccmaName; // 국가유산종목
  final String gcodeName; // 국가유산분류
  final String ccbaAsdt; // 지정(등록일)
  final String ccbaLcad; // 소재지 상세
  final String ccceName; // 시대
  final String imageUrl; // 메인노출이미지URL
  final String content; // 내용

  InfoDetail({
    // json
    required this.ccmaName,
    required this.gcodeName,
    required this.ccbaAsdt,
    required this.ccbaLcad,
    required this.ccceName,
    required this.imageUrl,
    required this.content,
  });

  factory InfoDetail.fromJson(Map<String, dynamic> json) {
    return InfoDetail(
      ccmaName: json['ccmaName'],
      gcodeName: json['gcodeName'],
      ccbaAsdt: json['ccbaAsdt'],
      ccbaLcad: json['ccbaLcad'],
      ccceName: json['ccceName'],
      imageUrl: json['imageUrl'],
      content: json['content'],
    );
  }
}