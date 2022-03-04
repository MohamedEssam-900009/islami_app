class RadioResponse {
  RadioResponse({
      required this.radios,});

  RadioResponse.fromJson(dynamic json) {
    if (json['radios'] != null) {
      radios = [];
      json['radios'].forEach((v) {
        radios.add(Radios.fromJson(v));
      });
    }
  }
  late List<Radios> radios;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (radios != null) {
      map['radios'] = radios.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "---تراتيل قصيرة متميزة---"
/// radio_url : "http://live.mp3quran.net:9702/;"

class Radios {
  Radios({
      required this.name, 
      required this.radioUrl,});

  Radios.fromJson(dynamic json) {
    name = json['name'];
    radioUrl = json['radio_url'];
  }
  late String name;
  late String radioUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['radio_url'] = radioUrl;
    return map;
  }

}