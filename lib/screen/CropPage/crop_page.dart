import 'dart:typed_data';

import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/components/constant.dart';

class CropPage extends StatefulWidget {
  static const routeName = '/cropPage';
  final Uint8List imageMemory;

  CropPage(this.imageMemory);

  @override
  _CropPageState createState() => _CropPageState();
}

class _CropPageState extends State<CropPage> {
  final _controller = CropController();
  Uint8List? croppedFinalImage;

  var _loadingImage = false;
  var _currentImage = 0;
  var _isCircleUi = true;
  var _isSumbnail = false;
  var _statusText = '';
  var _isCropping = false;

  void cropImage(Uint8List croppedData) {
    setState(() {
      croppedFinalImage = croppedData;
    });
    print(croppedData.runtimeType);
    Navigator.pop(context, croppedFinalImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarWidget(
        title: 'ویرایش تصویر',
      ),
      body: Column(
        children: [
          Expanded(
            child: Visibility(
              visible: croppedFinalImage == null,
              child: Stack(
                children: [
                  if (widget.imageMemory.isNotEmpty)
                    Crop(
                      controller: _controller,
                      image: widget.imageMemory,
                      onCropped: cropImage,
                      withCircleUi: _isCircleUi,
                      onStatusChanged: (status) => setState(() {
                        _statusText = <CropStatus, String>{
                              CropStatus.nothing: 'Crop has no image data',
                              CropStatus.loading:
                                  'Crop is now loading given image',
                              CropStatus.ready: 'Crop is now ready!',
                              CropStatus.cropping: 'Crop is now cropping image',
                            }[status] ??
                            '';
                      }),
                      initialSize: 0.5,
                      maskColor: _isSumbnail ? Colors.white : null,
                      cornerDotBuilder: (size, edgeAlignment) => _isSumbnail
                          ? const SizedBox.shrink()
                          : const DotControl(),
                    ),
                  Positioned(
                    right: 16,
                    bottom: 16,
                    child: GestureDetector(
                      onTapDown: (_) => setState(() => _isSumbnail = true),
                      onTapUp: (_) => setState(() => _isSumbnail = false),
                      child: CircleAvatar(
                        backgroundColor:
                            _isSumbnail ? Colors.blue.shade50 : Colors.blue,
                        child: Center(
                          child: Icon(Icons.crop_free_rounded),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              replacement: Center(
                child: croppedFinalImage == null
                    ? SizedBox.shrink()
                    : Image.memory(croppedFinalImage!),
              ),
            ),
          ),
          if (croppedFinalImage == null)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.radio_button_unchecked_outlined),
                          onPressed: () {
                            _isCircleUi = true;
                            _controller
                              ..withCircleUi = true
                              ..aspectRatio = 1;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isCropping = true;
                          });
                          _isCircleUi
                              ? _controller.cropCircle()
                              : _controller.crop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Icon(Icons.crop),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
