import 'package:flutter/material.dart';
import 'package:qoruz_marketplace/api/itemdata.dart';

class MarketPlaceDetailsScreen extends StatelessWidget {
  final dynamic request;
  const MarketPlaceDetailsScreen({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    final itemData = extractItemData(request);
    return Scaffold(
      appBar: AppBar(
        title: Text(itemData.name),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.grey.shade300,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: itemData.profileImage,
                          child:
                              request['user_details']?['profile_image'] == null
                                  ? const Icon(Icons.person, size: 20)
                                  : null,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              itemData.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              itemData.destination,
                              style: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 12),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.apartment_sharp,
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  itemData.company,
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        Text(
                          itemData.createdAt,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Looking for',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      const SizedBox(height: 5),
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
                                color: Colors.black,
                                fontSize: 13),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      Text(
                        "Highlights",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.currency_rupee,
                                  size: 15,
                                  color: Colors.grey.shade600,
                                ),
                                Flexible(
                                  child: Text(
                                    'Budget: ${itemData.budget}',
                                    style: const TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 30,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.branding_watermark_outlined,
                                  size: 15,
                                  color: Colors.grey.shade600,
                                ),
                                Flexible(
                                  child: Text(
                                    itemData.brand,
                                    style: const TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      buildDetail(
                        "Budget",
                        itemData.budget,
                      ),
                      buildDetail("Brand", itemData.brand),
                      buildDetail("Location", itemData.cities),
                      buildDetail("Type", itemData.type),
                      buildDetail("Language", itemData.language),
                      Text(
                        itemData.description,
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("WhatsApp Shared"),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 217, 247, 218)),
                              child: const Row(
                                children: [
                                  Text(
                                    "Share via WhatsApp",
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("LinkedIn Shared"),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 185, 203, 255)),
                              child: const Row(
                                children: [
                                  Text(
                                    "Share via LinkedIn",
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Key Highlights Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: buildhighlights(
                                    'Categories', itemData.categories),
                              ),
                              Expanded(
                                  child: buildhighlights(
                                      'Platform', itemData.platform))
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: buildhighlights(
                                    'Language', itemData.language),
                              ),
                              Expanded(
                                  child: buildhighlights(
                                      'Location', itemData.cities))
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child:
                                    buildhighlights('Required Count', '15-20'),
                              ),
                              Expanded(
                                  child: buildhighlights(
                                      'Our Budget', itemData.budget))
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: buildhighlights(
                                    'Brand Collab', itemData.brand),
                              ),
                              Expanded(
                                  child: buildhighlights('Required Followers',
                                      'Insta: ${itemData.igFollowerMin}-${itemData.igFollowerMax}\nYouTube: ${itemData.ytFollowersMin}-${itemData.ytFollowersMax}'))
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Edited"),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 240, 91, 108),
                              ),
                              child: const Center(
                                child: Text(
                                  "Edit",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Deleted"),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 240, 91, 108)),
                              child: const Center(
                                child: Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
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

  Widget buildhighlights(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 8.0, horizontal: 8.0), // Add horizontal padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(
            value,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
