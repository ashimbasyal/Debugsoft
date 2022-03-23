class ListPage {

  final String title;
  final String description;
 
  // final String urlImage;

  const ListPage({
  
    required this.description,
    required this.title,
  
    // required this.urlImage,
  });

  factory ListPage.fromJson(Map<String, dynamic> json) => ListPage(
        
        description: json['description'],
        title: json['title'],
     
        // urlImage: json['urlImage'],
      );

  Map<String, dynamic> toJson() => {

        'title': title,
        'description': description,
      
        // 'urlImage': urlImage,
      };
}
