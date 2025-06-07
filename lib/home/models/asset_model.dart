import 'dart:convert';

import 'package:exchange_app/home/models/currency.dart';
import 'package:flutter/foundation.dart';

/// The Asset class represents a collection of currencies and a timestamp.
/// It contains a list of Currency objects and a timestamp indicating when the data was fetched.
class Asset {
  Asset({required this.data, required this.timestamp});

  /// The list of currencies (data) and the timestamp when the data was fetched.
  final List<Currency> data;

  /// The timestamp indicating when the data was fetched.
  final int timestamp;

  Asset copyWith({List<Currency>? data, int? timestamp}) {
    return Asset(
      data: data ?? this.data,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.map((x) => x.toMap()).toList(),
      'timestamp': timestamp,
    };
  }

  factory Asset.fromMap(Map<String, dynamic> map) {
    return Asset(
      data: List<Currency>.from(
        map['data'].map<Currency>((x) => Currency.fromMap(x)),
      ),
      timestamp: map['timestamp'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Asset.fromJson(String source) =>
      Asset.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Asset(data: $data, timestamp: $timestamp)';

  @override
  bool operator ==(covariant Asset other) {
    if (identical(this, other)) return true;

    return listEquals(other.data, data) && other.timestamp == timestamp;
  }

  @override
  int get hashCode => data.hashCode ^ timestamp.hashCode;
}
