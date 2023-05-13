class Quote {
  final String text;
  final String author;

  const Quote({required this.text, required this.author});

  static List<Quote> quotes = [
    Quote(
      text: "You can never be overdressed or overeducated",
      author: "-Oscar Wilde",
    ),
    Quote(
      text: "Everybody has a plan until they get punched in face",
      author: "Mike Tyson",
    ),
    Quote(
      text: "I have not failed. I've just found 10,000 ways that won't work",
      author: "Thomas Edison",
    ),
  ];
}
