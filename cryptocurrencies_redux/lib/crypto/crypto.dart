class Crypto {
  final String id;
  final String name;
  final String symbol;
  final String priceUsd;

  const Crypto({
    this.id,
    this.name,
    this.symbol,
    this.priceUsd
  });

  @override
  String toString() {
    return 'Crypto{id: $id, name: $name, symbol: $symbol, priceUsd: $priceUsd}';
  }
}