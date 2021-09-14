import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/services/Currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  @override
  String selectedCurrency = 'USD';
  String selectedBTCRate = '?';
   String selectedETHRate = '?';
    String selectedLTCRate = '?';
  Currency currency = Currency();

  Future changeRate() async {
    final BTCrate = await currency.getRate(selectedCurrency,'BTC');
    final ETHrate = await currency.getRate(selectedCurrency,'ETH');
    final LTCrate = await currency.getRate(selectedCurrency,'LTC');



    setState(() {
      selectedBTCRate = BTCrate;
      selectedETHRate = ETHrate;
      selectedLTCRate = LTCrate;
    });
  }

  DropdownButton androidDropdown() {
    List<DropdownMenuItem> getDropdownItems() {
      List<DropdownMenuItem<String>> dropdownItems = [];
      for (String currency in currenciesList) {
        var newItem = DropdownMenuItem(
          child: Text(currency),
          value: currency,
        );
        dropdownItems.add(newItem);
      }
      return dropdownItems;
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: getDropdownItems(),
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
        changeRate();
      },
    );
  }

  CupertinoPicker iosPicker() {
    List<Text> getDropdowTexts() {
      List<Text> listItem = [];
      for (String currency in currenciesList) {
        Text newItem = Text(currency);
        listItem.add(newItem);
      }
      return listItem;
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
        });
      },
      children: getDropdowTexts(),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $selectedBTCRate $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
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
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = $selectedETHRate $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
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
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 LTC = $selectedLTCRate $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          TextButton(onPressed:(){changeRate();}
, child:Text("Calculate")),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iosPicker() : androidDropdown(),
          )
        ],
      ),
    );
  }
}
