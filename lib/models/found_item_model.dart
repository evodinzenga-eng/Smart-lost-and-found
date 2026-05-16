import 'package:cloud_firestore/cloud_firestore.dart';

/// Found item model
class FoundItemModel {
  final String id;
  final String userId;
  final String title;
  final String description;
  final String category;
  final String pickupLocation;
  final List<String> imageUrls;
  final String status; // available, claimed, archived
  final DateTime foundDate;
  final DateTime reportedDate;
  final double? latitude;
  final double? longitude;
  final String finderName;
  final String finderContact;
  final String? finderEmail;
  final bool isClaimed;
  final DateTime? claimedDate;
  final String? claimedByUserId;
  final DateTime createdAt;
  final DateTime? updatedAt;

  FoundItemModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.category,
    required this.pickupLocation,
    required this.imageUrls,
    this.status = 'available',
    required this.foundDate,
    required this.reportedDate,
    this.latitude,
    this.longitude,
    required this.finderName,
    required this.finderContact,
    this.finderEmail,
    this.isClaimed = false,
    this.claimedDate,
    this.claimedByUserId,
    required this.createdAt,
    this.updatedAt,
  });

  /// Convert FoundItemModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'description': description,
      'category': category,
      'pickupLocation': pickupLocation,
      'imageUrls': imageUrls,
      'status': status,
      'foundDate': Timestamp.fromDate(foundDate),
      'reportedDate': Timestamp.fromDate(reportedDate),
      'latitude': latitude,
      'longitude': longitude,
      'finderName': finderName,
      'finderContact': finderContact,
      'finderEmail': finderEmail,
      'isClaimed': isClaimed,
      'claimedDate':
          claimedDate != null ? Timestamp.fromDate(claimedDate!) : null,
      'claimedByUserId': claimedByUserId,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
    };
  }

  /// Create FoundItemModel from JSON
  factory FoundItemModel.fromJson(Map<String, dynamic> json) {
    return FoundItemModel(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      pickupLocation: json['pickupLocation'] ?? '',
      imageUrls: List<String>.from(json['imageUrls'] ?? []),
      status: json['status'] ?? 'available',
      foundDate: (json['foundDate'] as Timestamp).toDate(),
      reportedDate: (json['reportedDate'] as Timestamp).toDate(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      finderName: json['finderName'] ?? '',
      finderContact: json['finderContact'] ?? '',
      finderEmail: json['finderEmail'],
      isClaimed: json['isClaimed'] ?? false,
      claimedDate: json['claimedDate'] != null
          ? (json['claimedDate'] as Timestamp).toDate()
          : null,
      claimedByUserId: json['claimedByUserId'],
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      updatedAt: json['updatedAt'] != null
          ? (json['updatedAt'] as Timestamp).toDate()
          : null,
    );
  }

  /// Create a copy of FoundItemModel with updated fields
  FoundItemModel copyWith({
    String? id,
    String? userId,
    String? title,
    String? description,
    String? category,
    String? pickupLocation,
    List<String>? imageUrls,
    String? status,
    DateTime? foundDate,
    DateTime? reportedDate,
    double? latitude,
    double? longitude,
    String? finderName,
    String? finderContact,
    String? finderEmail,
    bool? isClaimed,
    DateTime? claimedDate,
    String? claimedByUserId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return FoundItemModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      pickupLocation: pickupLocation ?? this.pickupLocation,
      imageUrls: imageUrls ?? this.imageUrls,
      status: status ?? this.status,
      foundDate: foundDate ?? this.foundDate,
      reportedDate: reportedDate ?? this.reportedDate,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      finderName: finderName ?? this.finderName,
      finderContact: finderContact ?? this.finderContact,
      finderEmail: finderEmail ?? this.finderEmail,
      isClaimed: isClaimed ?? this.isClaimed,
      claimedDate: claimedDate ?? this.claimedDate,
      claimedByUserId: claimedByUserId ?? this.claimedByUserId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() =>
      'FoundItemModel(id: $id, title: $title, status: $status, isClaimed: $isClaimed)';
}
