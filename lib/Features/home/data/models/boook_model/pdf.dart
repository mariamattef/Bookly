class Pdf {
  final bool? isAvailable;
  final String? acsTokenLink;
  Pdf({  this.acsTokenLink, this.isAvailable});

  factory Pdf.fromJson(Map<String, dynamic> json) => Pdf(
        isAvailable: json['isAvailable'] as bool?,
        acsTokenLink: json['acsTokenLink'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'isAvailable': isAvailable,
        'acsTokenLink': acsTokenLink,
      };
}
