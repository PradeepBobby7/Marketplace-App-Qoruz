import 'package:flutter/material.dart';

class MarketPlaceItemData {
  final ImageProvider? profileImage;
  final String name;
  final String serviceType;
  final String company;
  final String destination;
  final String targetAudience;
  final String budget;
  final String brand;
  final String location;
  final String type;
  final String language;
  final String description;
  final String cities;
  final String platform;
  final String igFollowerMin;
  final String igFollowerMax;
  final String ytFollowersMin;
  final String ytFollowersMax;
  final String categories;
  final String createdAt;
  final bool isValueHigh;

  MarketPlaceItemData({
    required this.profileImage,
    required this.name,
    required this.serviceType,
    required this.company,
    required this.destination,
    required this.targetAudience,
    required this.budget,
    required this.brand,
    required this.location,
    required this.type,
    required this.language,
    required this.description,
    required this.cities,
    required this.platform,
    required this.igFollowerMin,
    required this.igFollowerMax,
    required this.ytFollowersMin,
    required this.ytFollowersMax,
    required this.categories,
    required this.createdAt,
    required this.isValueHigh,
  });
}

Widget buildDetails(String title, String value, {bool isMultiLine = false}) {
  return Container();
}

MarketPlaceItemData extractItemData(dynamic request) {
  return MarketPlaceItemData(
    profileImage: request['user_details']?['profile_image'] != null
        ? NetworkImage(request['user_details']['profile_image'])
        : null,
    name: request['user_details']?['name'] ?? 'Unknown',
    serviceType: request['service_type'] ?? "Unknown",
    company: request['user_details']?['company'] ?? "Unknown",
    destination: request['user_details']?['designation'] ?? "Unknown",
    targetAudience: request['target_audience'] ?? "Not Specified",
    budget: request['request_details']?['budget'] ?? "Not Specified",
    brand: request['request_details']?['brand'] ?? "Not Specified",
    location: request['request_details']?['cities'] is List<dynamic>
        ? (request['request_details']['cities'] as List<dynamic>).join(', ')
        : "Not Specified",
    type: request['type'] ?? "Not Specified",
    language: request['request_details']?['languages'] is List<dynamic>
        ? (request['request_details']['languages'] as List<dynamic>).join(', ')
        : "Not Specified",
    description: request['description'] ?? "No Description",
    cities: request['request_details']?['cities'] is List<dynamic>
        ? (request['request_details']['cities'] as List<dynamic>).join(', ')
        : "Not Specified",
    platform: request['request_details']?['platform'] is List<dynamic>
        ? (request['request_details']['platform'] as List<dynamic>).join(', ')
        : "Not Specified",
    igFollowerMin: request['request_details']?['followers_range']
            ?['ig_followers_min'] ??
        "0",
    igFollowerMax: request['request_details']?['followers_range']
            ?['ig_followers_max'] ??
        "0",
    ytFollowersMin: request['request_details']?['followers_range']
            ?['yt_subscribers_min'] ??
        "0",
    ytFollowersMax: request['request_details']?['followers_range']
            ?['yt_subscribers_max'] ??
        "0",
    categories: request['request_details']?['categories'] is List<dynamic>
        ? (request['request_details']['categories'] as List<dynamic>).join(', ')
        : "Not Specified",
    createdAt: request['created_at'],
    isValueHigh: request['is_high_value'] ?? false,
  );
}
