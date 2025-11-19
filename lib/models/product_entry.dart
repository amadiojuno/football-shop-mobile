// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String id;
    String name;
    String brand;
    int price;
    String description;
    double rating;
    int views;
    String thumbnail;
    String category;
    bool isFeatured;
    int? userId;

    ProductEntry({
        required this.id,
        required this.name,
        required this.brand,
        required this.price,
        required this.description,
        required this.rating,
        required this.views,
        required this.thumbnail,
        required this.category,
        required this.isFeatured,
        required this.userId,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) {
        // Check if response is from Django serializer (has 'model', 'pk', 'fields')
        if (json.containsKey('fields')) {
            final fields = json['fields'] as Map<String, dynamic>;
            return ProductEntry(
                id: json["pk"].toString(),
                name: fields["name"] ?? "",
                brand: fields["brand"] ?? "",
                price: fields["price"] ?? 0,
                description: fields["description"] ?? "",
                rating: (fields["rating"] ?? 0).toDouble(),
                views: fields["views"] ?? 0,
                thumbnail: fields["thumbnail"] ?? "",
                category: fields["category"] ?? "",
                isFeatured: fields["is_featured"] ?? false,
                userId: fields["user"],
            );
        }
        
        // Otherwise, parse direct format
        return ProductEntry(
            id: json["id"] ?? "",
            name: json["name"] ?? "",
            brand: json["brand"] ?? "",
            price: json["price"] ?? 0,
            description: json["description"] ?? "",
            rating: (json["rating"] ?? 0).toDouble(),
            views: json["views"] ?? 0,
            thumbnail: json["thumbnail"] ?? "",
            category: json["category"] ?? "",
            isFeatured: json["is_featured"] ?? false,
            userId: json["user_id"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "brand": brand,
        "price": price,
        "description": description,
        "rating": rating,
        "views": views,
        "thumbnail": thumbnail,
        "category": category,
        "is_featured": isFeatured,
        "user_id": userId,
    };
}
