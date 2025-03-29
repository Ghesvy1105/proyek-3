import 'package:freezed_annotation/freezed_annotation.dart';

part 'profil_model.freezed.dart';
part 'profil_model.g.dart';

@freezed
class ProfilModel with _$ProfilModel {
  factory ProfilModel({
    @Default("") String name,
    @Default("") String email,
  }) = _ProfilModel;

  factory ProfilModel.fromJson(Map<String, dynamic> json) =>
      _$ProfilModelFromJson(json);
}
