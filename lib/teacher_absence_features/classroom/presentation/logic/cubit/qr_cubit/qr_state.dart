part of 'qr_cubit.dart';

sealed class TeacherQrCodeState extends Equatable {
    const TeacherQrCodeState();
}

final class TeacherQrCodeInitial extends TeacherQrCodeState {
  @override
  List<Object> get props => [];

  const TeacherQrCodeInitial();
}

final class TeacherQrCodeScanned extends TeacherQrCodeState {
  final String scannedData;
  @override
  List<Object> get props => [
    scannedData,
  ];

  const TeacherQrCodeScanned(this.scannedData);
}
