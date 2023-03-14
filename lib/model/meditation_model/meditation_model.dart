class MeditationsModel {
  String audio;
  String background;
  String category;
  String description;
  int length;
  String title;
  String imageIcon;

  MeditationsModel({
    this.audio,
    this.background,
    this.category,
    this.description,
    this.length,
    this.title,
    this.imageIcon
  });

  factory MeditationsModel.fromMap(Map<String, dynamic> map) =>
      MeditationsModel(
        audio: map['audio'],
        background: map['background'],
        category: map['category'],
        description: map['description'],
        length: map['length'],
        title: map['title'],
        imageIcon: map['ImageIcon'],
      );

  Map<String, dynamic> meditationsMap() {
    return {
      'audio': audio,
      'background': background,
      'category': category,
      'description': description,
      'length': length,
      'title': title,
      'ImageIcon': imageIcon
    };
  }
}
