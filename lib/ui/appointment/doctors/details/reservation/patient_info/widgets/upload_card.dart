import 'dart:io';
import 'package:Signs/Utils/style/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadCard extends StatefulWidget {
  final Function(File cardImage, String cardId) onCardAdded;
  final String hint;
  const UploadCard({Key key, this.onCardAdded, this.hint}) : super(key: key);
  @override
  _UploadCardState createState() => _UploadCardState();
}

class _UploadCardState extends State<UploadCard> {
  File _image;
  final picker = ImagePicker();
  String errorMsg = '';
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: whiteSmoke,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: platinum)
          ),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.add, color: heavyBlue,),
                onPressed: (){
                  if(_image == null){
                    setState(() {
                      errorMsg = 'please select image first';
                    });
                    return;
                  }
                  if(textEditingController.text.isEmpty){
                    setState(() {
                      errorMsg = 'please enter patient id';
                    });
                    return;
                  }
                  widget.onCardAdded(_image, textEditingController.text);
                }
              ),
              Expanded(
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintText: widget.hint,
                    hintStyle: hintTextStyle
                  ),
                )
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: greySmoke,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:4.0, right: 4, top: 0, bottom: 0),
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      icon: Icon(Icons.camera_alt_rounded),
                      onPressed: (){
                        handleImagePickerSelection();
                      },
                      color: Colors.white,
                      iconSize: 32,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 4,),
        if(_image != null) Row(
          children: [
            Image.file(_image, width: 60, height: 40, fit: BoxFit.fitWidth,),
            SizedBox(width: 24,),
            IconButton(
                icon: Icon(Icons.delete),
                color: coralRed,
                onPressed: (){
                  setState(() {
                    _image = null;
                  });
                }
            )
          ],
        ),
        if(errorMsg.isNotEmpty) Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(errorMsg, style: errorTextStyle,),
        )
      ],
    );
  }

  void handleImagePickerSelection(){
    showCupertinoModalPopup(
      context: context,
      builder: (context){
        return CupertinoActionSheet(
          title: Text('select Image'),
          message: Text('Select image from Gallery or camera'),
          actions: [
            CupertinoActionSheetAction(
              onPressed: (){
                getImageFromCamera();
              },
              child: Text('Camera')
            ),
            CupertinoActionSheetAction(
              onPressed: (){
                getImageFromGallery();
              },
              child: Text('Gallery')
            ),
          ],
        );
      }
    );
  }
  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    Navigator.of(context).pop();
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    Navigator.of(context).pop();
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
