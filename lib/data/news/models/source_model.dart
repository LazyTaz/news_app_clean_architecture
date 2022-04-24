import '../../../domain/news/entities/source.dart';

class SourceModel extends Source {
  const SourceModel({
    required id,
    required name,
  }) : super(id: id, name: name);

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;

    return data;
  }
}
