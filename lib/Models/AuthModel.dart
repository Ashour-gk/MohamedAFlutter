class Authmodel {
  final String message;
  final bool status;

  Authmodel({required this.message, required this.status});
  factory Authmodel.fromjson(Map<String, dynamic> json) {
    return Authmodel(message: json["message"], status: json["status"]);
  }
}
