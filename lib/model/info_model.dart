class Info {
  final String ccbaKdcd; // 종목코드
  final String ccbaAsno; // 관리번호
  final String ccbaCtcd; // 시도코드
  final String ccbaMnm1; // 국가유산명(국문)
  String? imageUrl; // imgURL

  Info({
    // json
    required this.ccbaKdcd,
    required this.ccbaAsno,
    required this.ccbaCtcd,
    required this.ccbaMnm1,
    this.imageUrl,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      ccbaKdcd: json['ccbaKdcd'],
      ccbaAsno: json['ccbaAsno'],
      ccbaCtcd: json['ccbaCtcd'],
      ccbaMnm1: json['ccbaMnm1'],
      imageUrl: json['imageUrl'],
    );
  }
}