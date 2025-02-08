import 'dart:core';

import 'package:equatable/equatable.dart';

abstract class MarketPlaceState extends Equatable {
  @override
  List<Object> get props => [];
}

class MarketPlaceIntial extends MarketPlaceState {}

class MarketPlaceLoading extends MarketPlaceState {}

class MarketPlaceLoaded extends MarketPlaceState {
  final List<dynamic> request;
  final bool hasMore;

  MarketPlaceLoaded({required this.request, required this.hasMore});

  @override
  List<Object> get props => [request, hasMore];
}

class MarketPlaceError extends MarketPlaceState {
  final String message;
  MarketPlaceError({required this.message});

  @override
  List<Object> get props => [message];
}
