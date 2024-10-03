import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImagePicker extends StatefulWidget{
  const ImagePicker({super.key})



  @override
  State<StatefulWidget> createState() {
    return ImagePickerState();
  }}

class ImagePickerState extends State<ImagePicker>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.purple,
          foregroundImage: ...,
        ),
        TextButton.icon(onPressed: (){}, icon: const Icon(Icons.image, color: Colors.white,),label: const Text("Add Image", style: TextStyle(
          fontSize: 12,
          color: Colors.white
        ),
        ))
      ],
    )
  }

}