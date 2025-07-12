import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FoodSpecScreen(),
    );
  }
}

class FoodSpecScreen extends StatefulWidget {
  @override
  _FoodSpecScreenState createState() => _FoodSpecScreenState();
}

class _FoodSpecScreenState extends State<FoodSpecScreen> {
  File? _image;
  final picker = ImagePicker();
  final String apiKey =
      '1d729a5e21c54572b33deec06dba418b'; // Replace with your API key
  String? _result;

  Future<void> _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _result = null;
      });
      _analyzeImage();
    }
  }

  Future<void> _analyzeImage() async {
    if (_image == null) return;

    final mimeType = lookupMimeType(_image!.path);
    final request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://api.spoonacular.com/food/images/analyze?apiKey=$apiKey'),
    );

    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        _image!.path,
        contentType: MediaType.parse(mimeType!),
      ),
    );

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final data = json.decode(responseBody);
      setState(() {
        _result = data['category']['name'];
      });
    } else {
      throw Exception('Failed to analyze image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Specifications'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _image == null ? Text('No image selected.') : Image.file(_image!),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getImage,
              child: Text('Pick Image'),
            ),
            SizedBox(height: 20),
            _result == null
                ? Text('Select an image to analyze.')
                : Text('Result: $_result'),
          ],
        ),
      ),
    );
  }
}
