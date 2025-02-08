import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoruz_marketplace/api/api_service.dart';
import 'package:qoruz_marketplace/bloc/market_state.dart';
import 'package:qoruz_marketplace/bloc/marketplace_event.dart';

class MarketplaceBloc extends Bloc<MarketplaceEvent, MarketPlaceState> {
  final ApiService apiService;
  int currentPage = 1;
  bool hasMoreData = true;
  bool isLoading = false;
  MarketplaceBloc({required this.apiService}) : super(MarketPlaceIntial()) {
    on<FetchMarketPlaceRequest>(_onFetchMarketPlaceRequest);
    on<LoadMoreMarketPlaceReques>(_onLoadMoreMarketPlaceRequest);
  }
  Future<void> _onFetchMarketPlaceRequest(
      FetchMarketPlaceRequest event, Emitter<MarketPlaceState> emit) async {
    emit(MarketPlaceLoading());
    currentPage = 1;
    hasMoreData = true;
    try {
      final response =
          await apiService.fetchMarketplaceRequest(page: currentPage);
      final data = response['marketplace_requests'] as List<dynamic>;
      final pagination = response['pagination'] as Map<String, dynamic>;
      hasMoreData = pagination['has_more'] ?? false;
      emit(
        MarketPlaceLoaded(request: data, hasMore: hasMoreData),
      );
    } catch (e) {
      emit(MarketPlaceError(message: e.toString()));
    }
  }

  Future<void> _onLoadMoreMarketPlaceRequest(
      LoadMoreMarketPlaceReques event, Emitter<MarketPlaceState> emit) async {
    if (isLoading || !hasMoreData || state is! MarketPlaceLoaded) return;
    isLoading = true;
    final currentState = state as MarketPlaceLoaded;
    currentPage++;
    try {
      final response =
          await apiService.fetchMarketplaceRequest(page: currentPage);
      final newData = response['marketplace_requests'] as List<dynamic>;
      final pagination = response['pagination'] as Map<String, dynamic>;
      hasMoreData = pagination['has_more'] ?? false;
      final updatedRequest = List.from(currentState.request)..addAll(newData);

      emit(MarketPlaceLoaded(request: updatedRequest, hasMore: hasMoreData));
    } catch (e) {
      emit(MarketPlaceError(message: e.toString()));
    } finally {
      isLoading = false;
    }
  }
}
