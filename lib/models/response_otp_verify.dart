class OtpVerifyResponse {
  bool? status;
  String? message;
  int? totalClinics;
  List<Clinics>? clinics;
  String? otp;

  OtpVerifyResponse({
    this.status,
    this.message,
    this.totalClinics,
    this.clinics,
    this.otp,
  });

  OtpVerifyResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    totalClinics = json['totalClinics'];
    if (json['clinics'] != null) {
      clinics = <Clinics>[];
      json['clinics'].forEach((v) {
        clinics!.add(Clinics.fromJson(v));
      });
    }
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['totalClinics'] = totalClinics;
    if (clinics != null) {
      data['clinics'] = clinics!.map((v) => v.toJson()).toList();
    }
    data['otp'] = otp;
    return data;
  }
}

class Clinics {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? image;

  Clinics({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.image,
  });

  Clinics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'].toString();
    address = json['address'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone.toString();
    data['address'] = address;
    data['image'] = image;
    return data;
  }
}
