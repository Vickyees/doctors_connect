import 'dart:convert';
import 'package:http/http.dart' as http;

Future getData(url) async {
  http.Response Response = await http.get(Uri.parse(url));
  return Response.body;
}

Future<String> getBotReply(userMessage) async {
  String url = 'http://vickyeees.pythonanywhere.com/general_reply?Query=' +
      userMessage.toString();
  var data = await getData(url);
  var decodedData = jsonDecode(data);
  return decodedData['Query'];
}

Future getDiseaseInfo(disease) async {
  String url = 'http://vickyeees.pythonanywhere.com/DiseaseInfoApi?disease=' +
      disease.toString();
  var data = await getData(url);
  var decodedData = jsonDecode(data);
  return decodedData;
}

Future predictDisease(symptoms) async {
  String url =
      'http://vickyeees.pythonanywhere.com/PredictDiseaseApi?symptoms=' +
          symptoms.toString();
  var data = await getData(url);
  var decodedData = jsonDecode(data);
  return decodedData['predicted_results'];
}
