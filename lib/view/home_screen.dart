import 'package:diff_image2/diff_image2.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lenzosense/view/result_page.dart';
import 'dart:io';
import 'package:image/image.dart' as img;



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  XFile? image = null;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img1 = await picker.pickImage(source: media);
    print(img1!.path);

    setState(() {
      image = img1;
    });
  }

  void goo(img.Image first, img.Image second) {
    try {
      var diff = DiffImage.compareFromMemory(
        first,
        second,
      );
      print('The difference between images is: ${diff.diffValue} %');
    } catch(e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    image = null;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/splash.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            const SizedBox(height: 100),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset("assets/logo.png",width: size.width/2)),
            Container(
              width: 277,
              height: 246,
              decoration: BoxDecoration(
                color: HexColor("#D9D9D9").withOpacity(0.63),
                borderRadius: BorderRadius.circular(15)
              ),
              child: GestureDetector(
                onTap: (){
                    getImage(ImageSource.gallery);
                },
                child: Center(
                  child: image== null ?Text(
                      "Browse Image",
                    style: TextStyle(
                        color: HexColor("#FFFFFF"),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        decorationColor: HexColor("#FFFFFF")
                      ),
                  ) : Image.file(
                    //to show image, you type like this.
                    File(image!.path),
                    width: 277,
                    height: 246,
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ResultPage()));
                image = null;
                setState(() {

                });
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                width: 277,
                height: 51,
                decoration: BoxDecoration(
                    color: HexColor("#D9D9D9").withOpacity(0.63),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Center(
                  child: Text(
                    "Upload Image",
                    style: TextStyle(
                        color: HexColor("#FFFFFF"),
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              ),
            ),

          ],
        )
      ),
    );
  }
}
