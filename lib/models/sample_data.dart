class SampleTags {
  String tag;

  SampleTags({required this.tag});
}

List<SampleTags> sampleTags = [
  SampleTags(tag: 'tag 1'),
  SampleTags(tag: 'sample tag'),
  SampleTags(tag: 'today'),
  SampleTags(tag: 'flower'),
  SampleTags(tag: 'sub'),
  SampleTags(tag: 'technology'),
  SampleTags(tag: 'Java'),
  SampleTags(tag: 'Python'),
];

class Blog {
  String title;
  String image;
  int view;
  String author;

  Blog({
    required this.title,
    required this.image,
    required this.view,
    required this.author,
  });
}
