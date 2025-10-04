// To parse this JSON data, do
//
//     final getAppointmentsResponse = getAppointmentsResponseFromJson(jsonString);

import 'dart:convert';

GetAppointmentsResponse getAppointmentsResponseFromJson(String str) => GetAppointmentsResponse.fromJson(json.decode(str));

String getAppointmentsResponseToJson(GetAppointmentsResponse data) => json.encode(data.toJson());

class GetAppointmentsResponse {
  bool status;
  String message;
  Appointments data;

  GetAppointmentsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAppointmentsResponse.fromJson(Map<String, dynamic> json) => GetAppointmentsResponse(
    status: json["status"],
    message: json["message"],
    data: Appointments.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Appointments {
  int totalCount;
  dynamic totalPages;
  int currentPage;
  int perPage;
  List<AppointmentList> appointments;

  Appointments({
    required this.totalCount,
    required this.totalPages,
    required this.currentPage,
    required this.perPage,
    required this.appointments,
  });

  factory Appointments.fromJson(Map<String, dynamic> json) => Appointments(
    totalCount: json["total_count"],
    totalPages: json["total_pages"],
    currentPage: json["current_page"],
    perPage: json["per_page"],
    appointments: List<AppointmentList>.from(json["appointments"].map((x) => AppointmentList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_count": totalCount,
    "total_pages": totalPages,
    "current_page": currentPage,
    "per_page": perPage,
    "appointments": List<dynamic>.from(appointments.map((x) => x.toJson())),
  };
}

class AppointmentList {
  int id;
  int patientId;
  int doctorId;
  int clinicId;
  DateTime appointmentDate;
  String startTime;
  String endTime;
  int duration;
  String appointmentType;
  String? notes;
  bool sendEmail;
  bool sendSms;
  bool sendPush;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  AppointmentList({
    required this.id,
    required this.patientId,
    required this.doctorId,
    required this.clinicId,
    required this.appointmentDate,
    required this.startTime,
    required this.endTime,
    required this.duration,
    required this.appointmentType,
    required this.notes,
    required this.sendEmail,
    required this.sendSms,
    required this.sendPush,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory AppointmentList.fromJson(Map<String, dynamic> json) => AppointmentList(
    id: json["id"],
    patientId: json["patient_id"],
    doctorId: json["doctor_id"],
    clinicId: json["clinic_id"],
    appointmentDate: DateTime.parse(json["appointment_date"]),
    startTime: json["start_time"],
    endTime: json["end_time"],
    duration: json["duration"],
    appointmentType: json["appointment_type"],
    notes: json["notes"],
    sendEmail: json["send_email"],
    sendSms: json["send_sms"],
    sendPush: json["send_push"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "patient_id": patientId,
    "doctor_id": doctorId,
    "clinic_id": clinicId,
    "appointment_date": "${appointmentDate.year.toString().padLeft(4, '0')}-${appointmentDate.month.toString().padLeft(2, '0')}-${appointmentDate.day.toString().padLeft(2, '0')}",
    "start_time": startTime,
    "end_time": endTime,
    "duration": duration,
    "appointment_type": appointmentType,
    "notes": notes,
    "send_email": sendEmail,
    "send_sms": sendSms,
    "send_push": sendPush,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
  };
}
