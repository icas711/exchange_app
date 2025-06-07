import 'dart:convert';

import 'package:flutter/foundation.dart';

class Currency {
  Currency({
    required this.id,
    required this.rank,
    required this.symbol,
    required this.name,
    required this.supply,
    this.maxSupply,
    required this.marketCapUsd,
    required this.volumeUsd24Hr,
    required this.priceUsd,
    required this.changePercent24Hr,
    this.vwap24Hr,
    this.explorer,
    required this.tokens,
  });

  /// The unique identifier for the currency.
  final String id;

  /// The rank of the currency in terms of market capitalization.
  final String rank;

  /// The symbol of the currency (e.g., BTC for Bitcoin).
  final String symbol;

  /// The name of the currency (e.g., Bitcoin).
  final String name;

  /// The total supply of the currency.
  final String supply;

  /// The maximum supply of the currency, if applicable.
  final String? maxSupply;

  /// The market capitalization in USD.
  final String marketCapUsd;

  /// The trading volume in USD over the last 24 hours.
  final String volumeUsd24Hr;

  /// The current price in USD.
  final String priceUsd;

  /// The percentage change in price over the last 24 hours.
  final String changePercent24Hr;

  /// The volume-weighted average price over the last 24 hours, if available.
  final String? vwap24Hr;

  /// An optional explorer URL for the currency, if available.
  final String? explorer;
  final Map tokens;

  Currency copyWith({
    String? id,
    String? rank,
    String? symbol,
    String? name,
    String? supply,
    String? maxSupply,
    String? marketCapUsd,
    String? volumeUsd24Hr,
    String? priceUsd,
    String? changePercent24Hr,
    String? vwap24Hr,
    String? explorer,
    Map? tokens,
  }) {
    return Currency(
      id: id ?? this.id,
      rank: rank ?? this.rank,
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      supply: supply ?? this.supply,
      maxSupply: maxSupply ?? this.maxSupply,
      marketCapUsd: marketCapUsd ?? this.marketCapUsd,
      volumeUsd24Hr: volumeUsd24Hr ?? this.volumeUsd24Hr,
      priceUsd: priceUsd ?? this.priceUsd,
      changePercent24Hr: changePercent24Hr ?? this.changePercent24Hr,
      vwap24Hr: vwap24Hr ?? this.vwap24Hr,
      explorer: explorer ?? this.explorer,
      tokens: tokens ?? this.tokens,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'rank': rank,
      'symbol': symbol,
      'name': name,
      'supply': supply,
      'maxSupply': maxSupply,
      'marketCapUsd': marketCapUsd,
      'volumeUsd24Hr': volumeUsd24Hr,
      'priceUsd': priceUsd,
      'changePercent24Hr': changePercent24Hr,
      'vwap24Hr': vwap24Hr,
      'explorer': explorer,
      'tokens': tokens,
    };
  }

  factory Currency.fromMap(Map<String, dynamic> map) {
    return Currency(
      id: map['id'] as String,
      rank: map['rank'] as String,
      symbol: map['symbol'] as String,
      name: map['name'] as String,
      supply: map['supply'] as String,
      maxSupply: map['maxSupply'] as String?,
      marketCapUsd: map['marketCapUsd'] as String,
      volumeUsd24Hr: map['volumeUsd24Hr'] as String,
      priceUsd: map['priceUsd'] as String,
      changePercent24Hr: map['changePercent24Hr'] as String,
      vwap24Hr: map['vwap24Hr'] as String?,
      explorer: map['explorer'] as String?,
      tokens: Map.from(map['tokens'] as Map),
    );
  }

  String toJson() => json.encode(toMap());

  factory Currency.fromJson(String source) =>
      Currency.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Currency(id: $id, rank: $rank, symbol: $symbol, name: $name, supply: $supply, maxSupply: $maxSupply, marketCapUsd: $marketCapUsd, volumeUsd24Hr: $volumeUsd24Hr, priceUsd: $priceUsd, changePercent24Hr: $changePercent24Hr, vwap24Hr: $vwap24Hr, explorer: $explorer, tokens: $tokens)';
  }

  @override
  bool operator ==(covariant Currency other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.rank == rank &&
        other.symbol == symbol &&
        other.name == name &&
        other.supply == supply &&
        other.maxSupply == maxSupply &&
        other.marketCapUsd == marketCapUsd &&
        other.volumeUsd24Hr == volumeUsd24Hr &&
        other.priceUsd == priceUsd &&
        other.changePercent24Hr == changePercent24Hr &&
        other.vwap24Hr == vwap24Hr &&
        other.explorer == explorer &&
        mapEquals(other.tokens, tokens);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        rank.hashCode ^
        symbol.hashCode ^
        name.hashCode ^
        supply.hashCode ^
        maxSupply.hashCode ^
        marketCapUsd.hashCode ^
        volumeUsd24Hr.hashCode ^
        priceUsd.hashCode ^
        changePercent24Hr.hashCode ^
        vwap24Hr.hashCode ^
        explorer.hashCode ^
        tokens.hashCode;
  }
}
