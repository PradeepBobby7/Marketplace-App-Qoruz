import 'package:flutter/material.dart';
import 'package:qoruz_marketplace/api/api_service.dart';
import 'package:qoruz_marketplace/widgets/Widgets_buttons.dart';

class MarketPlaseScreen extends StatefulWidget {
  const MarketPlaseScreen({super.key});

  @override
  State<MarketPlaseScreen> createState() => _MarketPlaseScreenState();
}

class _MarketPlaseScreenState extends State<MarketPlaseScreen> {
  final ApiService apiService = ApiService();
  late Future<List<dynamic>> marketplcerequest;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    marketplcerequest = apiService.fetchMarketplaceRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Marketplace"),
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
            child: Center(
              child: FutureBuilder<List<dynamic>>(
                  future: marketplcerequest,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(
                        color: Colors.redAccent,
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Eroor:${snapshot.error}'),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('No Request Found'),
                      );
                    }
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final request = snapshot.data![index];
                          return MarketPlaceItem(request: request);
                        });
                  }),
            ),
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
    );
  }
}
