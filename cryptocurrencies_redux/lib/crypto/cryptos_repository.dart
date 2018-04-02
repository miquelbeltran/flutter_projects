import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cryptocurrencies_redux/crypto/crypto.dart';

const String baseUrl = "api.coinmarketcap.com";
const String tickerUrl = "/v1/ticker";

class CryptosRepository {
  HttpClient _httpClient = new HttpClient();

  Future<List<Crypto>> getCryptos() async {
    var request = await _httpClient.getUrl(new Uri.https(baseUrl, tickerUrl));
    var response = await request.close();
    var responseBody = await response.transform(UTF8.decoder).join();
    List<Map> json = JSON.decode(responseBody);
    return json.map(_mapCryptos).toList();
  }

  Crypto _mapCryptos(Map item) {
    return new Crypto(
      id: item['id'],
      name: item['name'],
      symbol: item['symbol'],
      priceUsd: item['price_usd']
    );
  }
}