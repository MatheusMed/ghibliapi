import 'dart:convert';

class GhibliModel {
  final String? id;
  final String? title;
  final String? originalTitle;
  final String? image;
  final String? movieBanner;
  final String? description;
  final String? director;
  final String? producer;
  final String? releaseDate;

  GhibliModel({
    this.id,
    this.title,
    this.originalTitle,
    this.image,
    this.movieBanner,
    this.description,
    this.director,
    this.producer,
    this.releaseDate,
  });
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (originalTitle != null) {
      result.addAll({'original_title': originalTitle});
    }
    if (image != null) {
      result.addAll({'image': image});
    }
    if (movieBanner != null) {
      result.addAll({'movie_banner': movieBanner});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    if (director != null) {
      result.addAll({'director': director});
    }
    if (producer != null) {
      result.addAll({'producer': producer});
    }
    if (releaseDate != null) {
      result.addAll({'release_date': releaseDate});
    }

    return result;
  }

  factory GhibliModel.fromMap(Map<String, dynamic> map) {
    return GhibliModel(
      id: map['id'],
      title: map['title'],
      originalTitle: map['original_title'],
      image: map['image'],
      movieBanner: map['movie_banner'],
      description: map['description'],
      director: map['director'],
      producer: map['producer'],
      releaseDate: map['release_date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GhibliModel.fromJson(String source) =>
      GhibliModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GhibliModel(id: $id, title: $title, originalTitle: $originalTitle, image: $image, movieBanner: $movieBanner, description: $description, director: $director, producer: $producer, releaseDate: $releaseDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GhibliModel &&
        other.id == id &&
        other.title == title &&
        other.originalTitle == originalTitle &&
        other.image == image &&
        other.movieBanner == movieBanner &&
        other.description == description &&
        other.director == director &&
        other.producer == producer &&
        other.releaseDate == releaseDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        originalTitle.hashCode ^
        image.hashCode ^
        movieBanner.hashCode ^
        description.hashCode ^
        director.hashCode ^
        producer.hashCode ^
        releaseDate.hashCode;
  }
}
