import 'package:http/http.dart' as http;

class NetHeyeAnNa {
  late bool netHeye;
  final String urlm = "https://google.com";
  // ignore: non_constant_identifier_names
  Future _NetHeye() async {
    var res = await http.get(Uri.parse(urlm));
    if (res.statusCode == 200) {
      netHeye = true;
    } else {
      () {
        netHeye = false;
      };
    }
  }
}
