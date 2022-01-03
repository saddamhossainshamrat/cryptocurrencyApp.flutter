import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'network.dart';
import 'currency.dart';

class Api extends StatelessWidget {
  getRate({fromcurrency, tocurrency}) async {
    Network network = await Network(
        'https://free.currconv.com/api/v7/convert?q=${fromcurrency}_${tocurrency}&compact=ultra&apiKey=29f1033a36d715126bf8');
    return await network.networkData();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
