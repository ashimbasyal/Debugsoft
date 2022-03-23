import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'package:debugsoft/comment.dart';
import 'package:debugsoft/home.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Detailspage extends StatelessWidget {
  File? file;
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    final txt = result.files.first;
    //File file = File(result.files.single.path);
    openFile(txt);
  }

  void _openFileExplorer() {}
  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : "No File Selected";

    print(fileName);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Route newRoute =
                  MaterialPageRoute(builder: (context) => HomeScreen());
              Navigator.pushReplacement(context, newRoute);
            }),
        title: const Text('Details'),
        backgroundColor: const Color(0xffacf4ff),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xffacf4ff),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://img-blog.csdnimg.cn/20190831205100363.png?x-oss-process=image/resize,m_fixed,h_224,w_224'))),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: ListTile(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Flutter is an open-source UI software development kit created by Google. It is used to develop cross platform applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia, and the web from a single codebase.',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Phone No:' + '  1234567890',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.red,
                      ),
                      Padding(padding: EdgeInsets.all(8)),
                      RaisedButton(
                        onPressed: () {
                          selectFile();
                        },
                        child: Text("choose file"),
                      ),
                      Text(fileName),
                      SizedBox(
                        height: 4,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(child: TestMe())
          ],
        ),
      ),
    );
  }
}

void openFile(PlatformFile file) {
  OpenFile.open(file.path!);
}
