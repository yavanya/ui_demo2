import 'package:barbers_demo/constant/ratings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Barber {
  Barber({
    @required this.name,
    @required this.address,
    @required this.mainImage,
    @required this.images,
    @required this.rating,
    @required this.isIndividual,
    @required this.isNew,
    @required this.isPopular,
    @required this.openTime,
    @required this.closeTime,
    @required this.services,
    this.reviews,
    this.team,
  }) {
    isRecent = true;
    isOpen = true;
    ratingString = getRatingString(rating);
    openTimeReal = TimeOfDay.fromDateTime(DateTime.parse(openTime));
    closeTimeReal = TimeOfDay.fromDateTime(DateTime.parse(closeTime));
    if (DateTime.now().hour < openTimeReal.hour ||
        DateTime.now().hour > closeTimeReal.hour) {
      isOpen = false;
    }
  }

  String name, address, mainImage, openTime, closeTime, ratingString;
  TimeOfDay openTimeReal;
  TimeOfDay closeTimeReal;
  List<String> images;
  double rating;
  bool isIndividual, isNew, isPopular, isRecent, isOpen;
  List<Service> services;
  List<Review> reviews;
  List<Team> team;

  factory Barber.fromJson(Map<String, dynamic> json) {
    return Barber(
      name: json["name"],
      address: json["address"],
      mainImage: json["mainImage"],
      images: List<String>.from(json["images"].map((x) => x)),
      rating: json["rating"].toDouble(),
      isIndividual: json["isIndividual"],
      isNew: json["isNew"],
      isPopular: json["isPopular"],
      openTime: json["openTime"],
      closeTime: json["closeTime"],
      services:
          List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
      reviews:
          List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
      team: json["team"] == null
          ? []
          : List<Team>.from(json["team"].map((x) => Team.fromJson(x))),
    );
  }
}

class Review {
  Review({
    this.avatarImage,
    this.name,
    this.review,
    this.date,
    this.rating,
  });

  String avatarImage, name, review, date;

  double rating;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        avatarImage: json["avatarImage"],
        name: json["name"],
        review: json["review"],
        date: json["date"],
        rating: json["rating"].toDouble(),
      );
}

class Service {
  Service({
    this.name,
    this.images,
    this.description,
    this.durationMin,
    this.durationMax,
    this.price,
  });

  String name, description, durationMin, durationMax, price;
  List<String> images;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        name: json["name"],
        images: List<String>.from(json["images"].map((x) => x)),
        description: json["description"],
        durationMin: json["durationMin"],
        durationMax: json["durationMax"],
        price: json["price"],
      );
}

class Team {
  Team({
    this.name,
    this.image,
  });

  String name, image;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        name: json["name"],
        image: json["image"],
      );
}
