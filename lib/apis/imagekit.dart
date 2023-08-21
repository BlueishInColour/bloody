import '../constant/configs.dart';
import 'package:flutter_imagekit/flutter_imagekit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

Future uploadToImageKit(
    {String filepath = '', String folder = 'general'}) async {
  // var image = await ImagePicker.platform.pickImage(
  //   source: ImageSource.gallery,
  // );
//
  // final file = image?.path;
  var url = ImageKit.io(
    File(filepath), folder: folder,
    //  folder: "folder_name/nested_folder", (Optional)
    privateKey: imagekitPrivateApiKey, // (Keep Confidential)
    onUploadProgress: (progressValue) {
      {
        debugPrint(progressValue.toString());
      }
    },
  ).then((String url) {
    // Get your uploaded Image file link from ImageKit.io
    //then save it anywhere you want. For Example- Firebase, MongoDB etc.
    {
      debugPrint(url); // your Uploaded Image/Video Link From Imagekit
    }
  });

  return url;
}
