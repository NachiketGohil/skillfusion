import 'dart:convert';
import 'dart:html' as html;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sf/api/models/course_response_model.dart';
import 'package:sf/api/models/roles_request_model.dart';
import 'package:sf/pages/pathways_page.dart';

import '../core/urls.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({super.key});

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class ResumeItem {
  final String name;
  final Uint8List? bytes;

  ResumeItem(this.name, this.bytes);
}

class _ResumePageState extends State<ResumePage> {
  TextEditingController controllerRoles = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();

  final List<ResumeItem> _files = [];

  void _pickFile() async {
    final html.FileUploadInputElement uploadInput =
        html.FileUploadInputElement();
    uploadInput.accept = '*/*';
    uploadInput.multiple = true;
    uploadInput.click();

    uploadInput.onChange.listen((e) async {
      final files = uploadInput.files;
      if (files != null) {
        for (final file in files) {
          final reader = html.FileReader();
          reader.readAsArrayBuffer(file);

          reader.onLoadEnd.listen((e) {
            final bytes = reader.result as Uint8List?;
            setState(() {
              _files.add(ResumeItem(file.name, bytes));
            });
          });
        }
      }
    });
  }

  void _removeFile(int index) {
    setState(() {
      _files.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 10,
        toolbarHeight: 50,
        automaticallyImplyLeading: true,
        title: const Text(
          "Add Resume & Roles",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// add resume
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _pickFile,
                    child: const Text('Upload Resume'),
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _files.length,
                      itemBuilder: (context, index) {
                        final file = _files[index];
                        return ListTile(
                          leading: const Icon(Icons.insert_drive_file),
                          title: Text(file.name),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_forever_outlined),
                            onPressed: () => _removeFile(index),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            /// add role
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: controllerRoles,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Add Roles",
                    ),
                  ),
                  TextField(
                    controller: controllerDescription,
                    maxLines: 6,
                    autocorrect: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Add Role Description",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () {
            _uploadFiles();
          },
          child: const Text("Submit"),
        ),
      ),
    );
  }

  Future<void> _uploadFiles() async {
    var uri = Uri.parse(Urls.uploadResume);
    var request = http.MultipartRequest('POST', uri);

    for (var file in _files) {
      if (file.bytes != null) {
        var multipartFile = http.MultipartFile.fromBytes(
          'files',
          file.bytes!,
          filename: file.name,
        );
        request.files.add(multipartFile);
      }
    }

    var response = await request.send();
    if (response.statusCode == 200) {
      print('Files uploaded successfully');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Files uploaded successfully'),
        ),
      );
      submitRoles();
    } else {
      print('File upload failed');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('File upload failed'),
        ),
      );
    }
  }

  Future<void> submitRoles() async {
    RolesRequestModel model = RolesRequestModel();
    model.role = controllerRoles.text;
    model.description = controllerDescription.text;

    ///
    var uri = Uri.parse(Urls.rolesCourse);
    var response = await http.post(
      uri,
      body: model,
    );

    if (response.statusCode == 200) {
      /// Fill the course object
      courseResponseModel =
          CourseResponseModel.fromJson(jsonDecode(response.body)['result']);

      /// Success snackbar
      print('Roles got successfully');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Roles got successfully'),
        ),
      );

      /// Navigate
      print("Navigating to Pathways");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PathwaysPage(
            courseResponseModel: courseResponseModel,
          ),
        ),
      );
    } else {
      /// Failed snackbar
      print('Roles Failed');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Roles Failed'),
        ),
      );
    }
  }
}

CourseResponseModel courseResponseModel = CourseResponseModel();
