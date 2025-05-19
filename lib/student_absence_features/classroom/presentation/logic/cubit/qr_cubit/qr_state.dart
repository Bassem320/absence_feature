part of 'qr_cubit.dart';

sealed class QrCodeState extends Equatable {
    const QrCodeState();
}

final class QrCodeInitial extends QrCodeState {
  @override
  List<Object> get props => [];

  const QrCodeInitial();
}

final class QrCodeScanned extends QrCodeState {
  final String scannedData;
  @override
  List<Object> get props => [
    scannedData,
  ];

  const QrCodeScanned(this.scannedData);
}
