import 'dart:convert';

PatientInfoResponse patientInfoResponseFromJson(String str) => PatientInfoResponse.fromJson(json.decode(str));

String patientInfoResponseToJson(PatientInfoResponse data) => json.encode(data.toJson());

class PatientInfoResponse {
  bool status;
  Patient patient;

  PatientInfoResponse({
    required this.status,
    required this.patient,
  });

  factory PatientInfoResponse.fromJson(Map<String, dynamic> json) => PatientInfoResponse(
    status: json["status"],
    patient: Patient.fromJson(json["patient"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "patient": patient.toJson(),
  };
}

class Patient {
  int id;
  String uniqueId;
  int clinicId;
  dynamic image;
  String name;
  String email;
  String countryCode;
  String phone;
  String emergencyContact;
  String gender;
  DateTime dob;
  String medicalCondition;
  String assignedDoctor;
  String notes;
  int isBlock;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Clinic doctor;
  Clinic clinic;

  Patient({
    required this.id,
    required this.uniqueId,
    required this.clinicId,
    required this.image,
    required this.name,
    required this.email,
    required this.countryCode,
    required this.phone,
    required this.emergencyContact,
    required this.gender,
    required this.dob,
    required this.medicalCondition,
    required this.assignedDoctor,
    required this.notes,
    required this.isBlock,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.doctor,
    required this.clinic,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    id: json["id"],
    uniqueId: json["unique_id"],
    clinicId: json["clinic_id"],
    image: json["image"],
    name: json["name"],
    email: json["email"],
    countryCode: json["country_code"],
    phone: json["phone"],
    emergencyContact: json["emergency_contact"],
    gender: json["gender"],
    dob: DateTime.parse(json["dob"]),
    medicalCondition: json["medical_condition"],
    assignedDoctor: json["assigned_doctor"],
    notes: json["notes"],
    isBlock: json["is_block"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    doctor: Clinic.fromJson(json["doctor"]),
    clinic: Clinic.fromJson(json["clinic"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "unique_id": uniqueId,
    "clinic_id": clinicId,
    "image": image,
    "name": name,
    "email": email,
    "country_code": countryCode,
    "phone": phone,
    "emergency_contact": emergencyContact,
    "gender": gender,
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "medical_condition": medicalCondition,
    "assigned_doctor": assignedDoctor,
    "notes": notes,
    "is_block": isBlock,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
    "doctor": doctor.toJson(),
    "clinic": clinic.toJson(),
  };
}

class Clinic {
  int id;
  String uniqueId;
  int role;
  int? doctorClinicId;
  dynamic image;
  String name;
  String email;
  String? countryCode;
  String? phone;
  String specializationId;
  String departmentId;
  String address;
  String? lat;
  String? lng;
  String? notes;
  dynamic appIcon;
  dynamic appColor;
  dynamic appIconUrl;
  int appChatPermissions;
  int appAllowPhotoUploadPermissions;
  int appDailyReminderPermissions;
  int isBlock;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Clinic({
    required this.id,
    required this.uniqueId,
    required this.role,
    required this.doctorClinicId,
    required this.image,
    required this.name,
    required this.email,
    required this.countryCode,
    required this.phone,
    required this.specializationId,
    required this.departmentId,
    required this.address,
    required this.lat,
    required this.lng,
    required this.notes,
    required this.appIcon,
    required this.appColor,
    required this.appIconUrl,
    required this.appChatPermissions,
    required this.appAllowPhotoUploadPermissions,
    required this.appDailyReminderPermissions,
    required this.isBlock,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Clinic.fromJson(Map<String, dynamic> json) => Clinic(
    id: json["id"],
    uniqueId: json["unique_id"],
    role: json["role"],
    doctorClinicId: json["doctor_clinic_id"],
    image: json["image"],
    name: json["name"],
    email: json["email"],
    countryCode: json["country_code"],
    phone: json["phone"],
    specializationId: json["specialization_id"],
    departmentId: json["department_id"],
    address: json["address"],
    lat: json["lat"],
    lng: json["lng"],
    notes: json["notes"],
    appIcon: json["app_icon"],
    appColor: json["app_color"],
    appIconUrl: json["app_icon_url"],
    appChatPermissions: json["app_chat_permissions"],
    appAllowPhotoUploadPermissions: json["app_allow_photo_upload_permissions"],
    appDailyReminderPermissions: json["app_daily_reminder_permissions"],
    isBlock: json["is_block"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "unique_id": uniqueId,
    "role": role,
    "doctor_clinic_id": doctorClinicId,
    "image": image,
    "name": name,
    "email": email,
    "country_code": countryCode,
    "phone": phone,
    "specialization_id": specializationId,
    "department_id": departmentId,
    "address": address,
    "lat": lat,
    "lng": lng,
    "notes": notes,
    "app_icon": appIcon,
    "app_color": appColor,
    "app_icon_url": appIconUrl,
    "app_chat_permissions": appChatPermissions,
    "app_allow_photo_upload_permissions": appAllowPhotoUploadPermissions,
    "app_daily_reminder_permissions": appDailyReminderPermissions,
    "is_block": isBlock,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
  };
}
