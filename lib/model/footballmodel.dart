class Footballmodel {
  String? name;
  List<Clubs>? clubs;

  Footballmodel({this.name, this.clubs});

  Footballmodel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['clubs'] != null) {
      clubs = <Clubs>[];
      json['clubs'].forEach((v) {
        clubs!.add(new Clubs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.clubs != null) {
      data['clubs'] = this.clubs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Clubs {
  String? name;
  Null? code;
  String? country;

  Clubs({required this.name, this.code, this.country});

  Clubs.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    data['country'] = this.country;
    return data;
  }
}
