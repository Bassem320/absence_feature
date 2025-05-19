import 'package:json_annotation/json_annotation.dart';
import 'package:shared_core/shared_core.dart';


@JsonSerializable()
class CreditStaffEntity {
  CreditStaffEntity({
    this.id,
    this.name,
    this.title,
  });

  @JsonKey(name: 'ID')
  String? id;
  @JsonKey(name: 'Name')
  String? name;
  @JsonKey(name: 'Title')
  String? title;


  @override
  String toString() {
    if(title.checkData()) {
      return '$title $name';
    }else if(name.checkData()){
      return '$name';
    }else{
      return '';
    }
  }
}
