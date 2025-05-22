import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:shared_core/shared_core.dart';

import '../logic/cubit/qr_cubit/qr_cubit.dart';
import 'scanner_error_widget.dart';


class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> with WidgetsBindingObserver {
  final controller = MobileScannerController(
    detectionTimeoutMs: 500,
    formats: [BarcodeFormat.all],
  );

  StreamSubscription<Object?>? _subscription;

  @override
  void initState() {
    super.initState();
    // Start listening to lifecycle changes.
    WidgetsBinding.instance.addObserver(this);

    // Start listening to the barcode events.
    _subscription = controller.barcodes.listen(_handleBarcode);

    // Finally, start the scanner itself.
    unawaited(controller.start());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // If the controller is not ready, do not try to start or stop it.
    // Permission dialogs can trigger lifecycle changes before the controller is ready.
    if (!controller.value.hasCameraPermission) {
      return;
    }

    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        return;
      case AppLifecycleState.resumed:
        // Restart the scanner when the app is resumed.
        // Don't forget to resume listening to the barcode events.
        _subscription = controller.barcodes.listen(_handleBarcode);

        unawaited(controller.start());
      case AppLifecycleState.inactive:
        // Stop the scanner when the app is paused.
        // Also stop the barcode events subscription.
        unawaited(_subscription?.cancel());
        _subscription = null;
        unawaited(controller.stop());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QrCodeCubit, QrCodeState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is QrCodeScanned) {
          showDialog(
            context: context,
            builder: (context) => AdaptiveAlertDialog(
                title: Text("Absence Done"),
                content: Text("Thank You for your presence"),
                actions: [
                  DialogAction("Done", () {
                    context.pop();
                    context.pop();
                  },)
                ]),
          );
        }
      },
      child: MobileScanner(
        fit: BoxFit.cover,
        controller: controller,
        errorBuilder: (context, error) {
          return ScannerErrorWidget(error: error);
        },
      ),
    );
  }

  @override
  Future<void> dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    // Stop listening to the barcode events.
    unawaited(_subscription?.cancel());
    _subscription = null;
    // Dispose the widget itself.
    super.dispose();
    // Finally, dispose of the controller.
    await controller.dispose();
  }

  void _handleBarcode(BarcodeCapture barcodes) {
    final scannedData = barcodes.barcodes.first.displayValue;
    if (scannedData.checkData()) {
      context.read<QrCodeCubit>().scanData(scannedData!);
    }
  }

  @override
  void deactivate() {
    controller.stop();
    super.deactivate();
  }

  @override
  void activate() {
    super.activate();
    controller.start();
  }
}
