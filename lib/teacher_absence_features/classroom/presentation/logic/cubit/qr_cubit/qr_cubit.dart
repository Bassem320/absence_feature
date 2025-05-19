import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'qr_state.dart';

class TeacherQrCodeCubit extends Cubit<TeacherQrCodeState> {
  TeacherQrCodeCubit() : super(const TeacherQrCodeInitial());

  void scanData(String data){
    emit(TeacherQrCodeScanned(data));
  }

  void clear(){
    emit(const TeacherQrCodeInitial());
  }
}
