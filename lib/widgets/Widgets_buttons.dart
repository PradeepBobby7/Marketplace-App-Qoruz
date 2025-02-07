import 'package:flutter/material.dart';
import 'package:qoruz_marketplace/screens/itemsdetails_Screen.dart';

class FilterButton extends StatelessWidget {
  final String title;
  final bool isActive;
  const FilterButton({super.key, required this.title, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isActive ? Colors.redAccent : Colors.grey.shade200,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MarketPlaceItem extends StatelessWidget {
  final dynamic request;
  const MarketPlaceItem({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MarketPlaceDetailsScreen(request: request),
          ),
        );
      },
      child: Stack(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            elevation: 10,
            shadowColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 23.0,
                        backgroundImage:
                            request['user_details']?['profile_image'] != null
                                ? NetworkImage(
                                    request['user_details']['profile_image'])
                                : null,
                        child: request['user_details']?['profile_image'] == null
                            ? const Icon(Icons.person, size: 20)
                            : null,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            request['user_details']?['name'] ?? 'Unknown',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            '${request['service_type'] ?? "Unknown"} at ${request['user_details']?['company'] ?? "Unknown"}',
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 12),
                          ),
                          const SizedBox(height: 3),
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                size: 14,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                request['created_at'],
                                style: const TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.group_work,
                        color: Colors.redAccent,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Looking for ${request['target_audience'] ?? "Not Specified"}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                            fontSize: 13),
                      ),
                    ],
                  ),
                  const Divider(),
                  buildDetail("Budget", request['budget'] ?? "Not Specified"),
                  buildDetail("Brand", request['brand'] ?? "Not Specified"),
                  buildDetail(
                    "Location",
                    request['request_details']?['cities'] is List<dynamic>
                        ? (request['request_details']['cities']
                                as List<dynamic>)
                            .join(', ')
                        : "Not Specified",
                  ),
                  buildDetail("Type", request['type'] ?? "Not Specified"),
                  buildDetail(
                    "Language",
                    request['request_details']?['languages'] is List<dynamic>
                        ? (request['request_details']['languages']
                                as List<dynamic>)
                            .join(', ')
                        : "Not Specified",
                  ),
                  Text(
                    request['description'] ?? "No Description",
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          size: 16, color: Colors.grey),
                      Text(
                        request['request_details']?['cities'] is List<dynamic>
                            ? (request['request_details']['cities']
                                    as List<dynamic>)
                                .join(', ')
                            : "Not Specified",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.camera_alt_outlined,
                          size: 16, color: Colors.pink),
                      Text(
                        "${request['request_details']?['followers_range']?['ig_followers_min'] ?? "0"} - ${request['request_details']?['followers_range']?['ig_followers_max'] ?? "0"}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        request['request_details']?['categories']
                                is List<dynamic>
                            ? (request['request_details']['categories']
                                    as List<dynamic>)
                                .join(', ')
                            : "Not Specified",
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (request['is_high_value'] == true)
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "High Value",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildDetail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text("$title: ", style: const TextStyle()),
          Expanded(
            child: Text(value, style: const TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
