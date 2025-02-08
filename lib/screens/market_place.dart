import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoruz_marketplace/api/api_service.dart';
import 'package:qoruz_marketplace/bloc/market_state.dart';
import 'package:qoruz_marketplace/bloc/marketplace_bloc.dart';
import 'package:qoruz_marketplace/widgets/Widgets_buttons.dart';

import '../bloc/marketplace_event.dart';

class MarketPlascreen extends StatefulWidget {
  const MarketPlascreen({super.key});

  @override
  State<MarketPlascreen> createState() => _MarketPlaseScreenState();
}

class _MarketPlaseScreenState extends State<MarketPlascreen> {
  final ApiService apiService = ApiService();
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MarketplaceBloc>(
      create: (context) => MarketplaceBloc(apiService: apiService)
        ..add(FetchMarketPlaceRequest()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Marketplace",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type tour Requierment here...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilterButton(title: 'For You'),
                  FilterButton(
                    title: 'Recent',
                    isActive: true,
                  ),
                  FilterButton(title: 'My Request'),
                  FilterButton(title: 'Older')
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: BlocBuilder<MarketplaceBloc, MarketPlaceState>(
                  builder: (context, state) {
                if (state is MarketPlaceLoading && currentPage == 1) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.redAccent,
                    ),
                  );
                } else if (state is MarketPlaceError) {
                  return Center(
                    child: Text('Error: ${state.message}'),
                  );
                } else if (state is MarketPlaceLoaded) {
                  final requests = state.request;
                  return ListView.builder(
                      itemCount: requests.length + (state.hasMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index < requests.length) {
                          final request = requests[index];
                          return MarketPlaceItem(request: request);
                        } else if (state.hasMore) {
                          currentPage++;
                          context
                              .read<MarketplaceBloc>()
                              .add(LoadMoreMarketPlaceReques());
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Container();
                        }
                      });
                } else {
                  return Container();
                }
              }),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.redAccent,
          elevation: 10,
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          label: const Text(
            'Post Request',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// child: Center(
//               child: FutureBuilder<List<dynamic>>(
//                   future: marketplcerequest,
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const CircularProgressIndicator(
//                         color: Colors.redAccent,
//                       );
//                     } else if (snapshot.hasError) {
//                       return Center(
//                         child: Text('Eroor:${snapshot.error}'),
//                       );
//                     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                       return const Center(
//                         child: Text('No Request Found'),
//                       );
//                     }
//                     return ListView.builder(
//                         itemCount: snapshot.data!.length,
//                         itemBuilder: (context, index) {
//                           final request = snapshot.data![index];
//                           return MarketPlaceItem(request: request);
//                         });
//                   }),
//             ),