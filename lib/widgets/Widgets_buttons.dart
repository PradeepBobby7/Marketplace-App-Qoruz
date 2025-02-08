import 'package:flutter/material.dart';
import 'package:qoruz_marketplace/api/itemdata.dart';
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
    final itemData = extractItemData(request);
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
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            elevation: 10,
            shadowColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 27.0,
                        backgroundImage: itemData.profileImage,
                        child: request['user_details']?['profile_image'] == null
                            ? const Icon(Icons.person, size: 20)
                            : null,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            itemData.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            '${itemData.destination} at ${itemData.company}',
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
                                itemData.createdAt,
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
                        'Looking for ${itemData.targetAudience}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                            fontSize: 13),
                      ),
                    ],
                  ),
                  const Divider(),
                  buildDetail("Budget", itemData.budget),
                  buildDetail("Brand", itemData.brand),
                  buildDetail("Location", itemData.location),
                  buildDetail("Type", itemData.type),
                  buildDetail("Language", itemData.language),
                  Text(
                    itemData.description,
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          size: 16, color: Colors.grey),
                      Expanded(
                        child: Text(
                          itemData.cities,
                          style: const TextStyle(color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
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
                        "${itemData.igFollowerMin} - ${itemData.igFollowerMax}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        itemData.categories,
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (itemData.isValueHigh == true)
            Positioned(
              top: 3,
              right: 30,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.cookie_rounded,
                      size: 15,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "High Value",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ],
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
            child: Text(
              value,
              style: const TextStyle(color: Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
