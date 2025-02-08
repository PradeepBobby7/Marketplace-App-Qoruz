import 'package:equatable/equatable.dart';

abstract class MarketplaceEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchMarketPlaceRequest extends MarketplaceEvent{}

class LoadMoreMarketPlaceReques extends MarketplaceEvent{}
