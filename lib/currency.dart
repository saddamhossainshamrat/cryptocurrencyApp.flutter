import 'dart:math';

import 'package:bitcoinapp/network.dart';
import 'package:flutter/material.dart';
import 'api.dart';
import 'cryptoList.dart';

class Currency extends StatefulWidget {
  //const Currency({Key? key}) : super(key: key);

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  var bitcoin = 0.0;
  var etherium = 0.0;
  var ltherium = 0.0;
  var bitcoincash = 0.0;
  var stellar = 0.0;
  String selectValue = "Choose Currency";
  List<DropdownMenuItem<String>> get currencyItems {
    List<DropdownMenuItem<String>> currencyItems = [
      DropdownMenuItem(child: Text("Select"), value: "Choose Currency"),
      DropdownMenuItem(child: Text("USD"), value: "USD"),
      DropdownMenuItem(child: Text("EUR "), value: "EUR"),
      DropdownMenuItem(child: Text("BDT "), value: "BDT "),
    ];
    return currencyItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto Converter"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                    child: Card(
                      color: Colors.lightBlueAccent,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 28.0),
                        child: Text(
                          '1 Bitcoin =  $bitcoin',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                    child: Card(
                      color: Colors.lightBlueAccent,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 28.0),
                        child: Text(
                          '1 Etherium = $etherium',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                    child: Card(
                      color: Colors.lightBlueAccent,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 28.0),
                        child: Text(
                          '1 Litecoin = $ltherium',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                    child: Card(
                      color: Colors.lightBlueAccent,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 28.0),
                        child: Text(
                          '1 Bitcoin Cash = $bitcoincash',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                    child: Card(
                      color: Colors.lightBlueAccent,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 28.0),
                        child: Text(
                          '1 Stellar = $stellar',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.blue,
                      ),
                      dropdownColor: Colors.white,
                      value: selectValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectValue = newValue!;
                          Api()
                              .getRate(
                                  fromcurrency: CryptoList().cryptocurrency[0],
                                  tocurrency: selectValue)
                              .then((value) => bitcoin = value[
                                  '${CryptoList().cryptocurrency[0]}_$selectValue']);
                          Api()
                              .getRate(
                                  fromcurrency: CryptoList().cryptocurrency[1],
                                  tocurrency: selectValue)
                              .then((value) => etherium = value[
                                  '${CryptoList().cryptocurrency[1]}_$selectValue']);
                          Api()
                              .getRate(
                                  fromcurrency: CryptoList().cryptocurrency[2],
                                  tocurrency: selectValue)
                              .then((value) => ltherium = value[
                                  '${CryptoList().cryptocurrency[2]}_$selectValue']);
                          Api()
                              .getRate(
                                  fromcurrency: CryptoList().cryptocurrency[3],
                                  tocurrency: selectValue)
                              .then((value) => bitcoincash = value[
                                  '${CryptoList().cryptocurrency[3]}_$selectValue']);
                          Api()
                              .getRate(
                                  fromcurrency: CryptoList().cryptocurrency[4],
                                  tocurrency: selectValue)
                              .then((value) => stellar = value[
                                  '${CryptoList().cryptocurrency[4]}_$selectValue']);
                        });
                      },
                      items: currencyItems),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
