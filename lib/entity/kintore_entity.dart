class KintoreEntity {
  String date;
  int quota = 0;
  int doneUdetate = 0;
  int doneFukkin = 0;
  KintoreEntity({this.date, this.quota, this.doneUdetate, this.doneFukkin});

  factory KintoreEntity.fromJson(Map<String, dynamic> json) {
    return KintoreEntity(
        date: json['date'],
        quota: json['quota'],
        doneUdetate: json['doneUdetate'],
        doneFukkin: json['doneFukkin']);
  }

  Map<String, dynamic> toJson() => {
        'date': date,
        'quota': quota,
        'doneUdetate': doneUdetate,
        'doneFukkin': doneFukkin,
      };
}
