

import 'dart:convert';

List<Model> modelFromJson(String str) => List<Model>.from(json.decode(str).map((x) => Model.fromJson(x)));


class Model {
    Model({
        this.id,
        this.author,
        this.width,
        this.height,
        this.url,
        this.downloadUrl,
    });

    final String ?id;
    final String ?author;
    final int ?width;
    final int ?height;
    final String ?url;
    final String ?downloadUrl;

    factory Model.fromJson(Map<String, dynamic> json) => Model(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
    );

    
}
