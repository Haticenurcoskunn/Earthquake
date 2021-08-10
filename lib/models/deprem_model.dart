class Deprem {
  Deprem({
    required this.tarih,
    required this.saat,
    required this.enlem,
    required this.boylam,
    required this.derinlik,
    required this.buyukluk,
    required this.yer,
    required this.sehir,
  });

  String tarih;
  String saat;
  String enlem;
  String boylam;
  String derinlik;
  String buyukluk;
  String yer;
  String sehir;

  factory Deprem.fromJson(Map<String, dynamic> json) => Deprem(
        tarih: json["tarih"],
        saat: json["saat"],
        enlem: json["enlem"],
        boylam: json["boylam"],
        derinlik: json["derinlik"],
        buyukluk: json["buyukluk"],
        yer: json["yer"],
        sehir: json["sehir"],
      );
}
