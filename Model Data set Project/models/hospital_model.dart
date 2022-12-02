class Hospital {
  int? id;
  String? name;
  String? category;
  int? releaseYear;
  double? rating;
  String? description;
  String? image;
  double budget;
  double boxOffice;
  String language;
  String country;
  String production;
  int runningTime;
  String director;
  String producer;
  Hospital(
      {this.id,
      this.name,
      this.category,
      this.releaseYear,
      this.rating,
      this.description,
      this.image,
      this.budget = 150,
      this.boxOffice = 950,
      this.language = "বাংলা",
      this.country = 'বাংলাদেশ',
      this.production = 'বই সমগ্র',
      this.runningTime = 140,
      this.director = 'জীবনানন্দ দাশ',
      this.producer = ' তিমির (১৯৪৮)'});
}
