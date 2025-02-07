import 'package:flutter/material.dart';

class MarketPlaceDetailsScreen extends StatelessWidget {
  final dynamic request;
  const MarketPlaceDetailsScreen({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(request['user_details']?['name'] ?? ['Details']),
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
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage:
                              request['user_details']?['profile_image'] != null
                                  ? NetworkImage(
                                      request['user_details']['profile_image'])
                                  : null,
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
                              request['user_details']?['name'] ?? 'Unknown',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              '${request['service_type'] ?? "Unknown"}',
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
                                  '${request['user_details']?['company'] ?? "Unknown"}',
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
                          request['created_at'],
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
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
                            'Looking for ${request['target_audience'] ?? "Not Specified"}',
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
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.currency_rupee,
                                  size: 15,
                                  color: Colors.grey.shade600,
                                ),
                                const Text(
                                  'Budget: 1,45,000',
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.branding_watermark_outlined,
                                  size: 15,
                                  color: Colors.grey.shade600,
                                ),
                                const Text(
                                  'Brand: Swiggy',
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      buildDetail(
                          "Budget", request['budget'] ?? "Not Specified"),
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
                        request['request_details']?['languages']
                                is List<dynamic>
                            ? (request['request_details']['languages']
                                    as List<dynamic>)
                                .join(', ')
                            : "Not Specified",
                      ),
                      Text(
                        request['description'] ?? "No Description",
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
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
                          const SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
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
                        ],
                      ),
                      const SizedBox(
                        height: 10,
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
                                    'Categories', 'Lifestyle,Fashion'),
                              ),
                              Expanded(
                                  child: buildhighlights(
                                      'Platform', 'Instagram,Youtube'))
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: buildhighlights('Language',
                                    'Hindi, Kannada, Malayalam\nTamil & Telugu'),
                              ),
                              Expanded(
                                  child: buildhighlights('Location',
                                      'Bangalore, TamilNadu, Kerala\nGoa Bangalore, TamilNadu'))
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child:
                                    buildhighlights('Required Count', '15-20'),
                              ),
                              Expanded(
                                  child:
                                      buildhighlights('Our Budget', '1,45,000'))
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child:
                                    buildhighlights('Brand Collab', 'Swiggy'),
                              ),
                              Expanded(
                                  child: buildhighlights('Required Followers',
                                      'Insta: 500k-1M+\nYoutube: 500k-1M+'))
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
                                )),
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
                                    backgroundColor: const Color.fromARGB(
                                        255, 240, 91, 108)),
                                child: const Center(
                                  child: Text(
                                    "Delete",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
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
