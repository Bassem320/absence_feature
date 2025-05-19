import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'qr_state.dart';

class QrCodeCubit extends Cubit<QrCodeState> {
  QrCodeCubit() : super(const QrCodeInitial());

  void scanData(String data){
    emit(QrCodeScanned(data));
  }

  void clear(){
    emit(const QrCodeInitial());
  }
}
