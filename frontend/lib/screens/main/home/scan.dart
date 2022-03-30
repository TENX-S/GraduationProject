import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/common/router.dart';
import 'package:frontend/common/styles.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:uuid/uuid.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        _buildQrView(context),
        Positioned(
          top: 50,
          left: 0,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColor.primary,
            ),
            onPressed: () => context.go(AppRouter.main),
          ),
        ),
      ]),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 350.0
        : 400.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: AppColor.primary,
        borderRadius: 5,
        borderLength: 30,
        borderWidth: 5,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(
        context,
        ctrl,
        p,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      try {
        if (result != null) {
          return;
        }
        controller.pauseCamera();
        result = scanData;
        var id = result!.code!;
        Uuid.parse(id);
        context.go(
          '${AppRouter.post}?query=$id&from=${AppRouter.scan}',
        );
        result = null;
        controller.resumeCamera();
        return;
      } on FormatException {
        return;
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('没有相机权限')),
      );
    }
  }
}
