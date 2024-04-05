class BookEntity {
  final String bookId;
  final String title;
  final String image;
  final String publisher;
  final String previewLink;
  final String category;
  final List<String> bookAuthors;

  BookEntity(
      {required this.previewLink,
      required this.bookId,
      required this.title,
      required this.image,
      required this.publisher,
      required this.bookAuthors,
        required this.category, });
}
