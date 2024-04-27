class Project {
  final String name;
  final String description;
  final String image;
  final String link;

  Project(this.name, this.description, this.image, this.link);
}

List<Project> projectList = [
  Project(
    'Skonnect',
    'Presenting "Skonnect" - a Flutter mobile application is a social platform that connects various sports enthusiasts, coaches, and players. It offers the facility to upload playing videos and receive reviews from certified coaches. Users can also comment on and like videos. Additionally, users can book arenas with stripe payment gateway in just a few simple steps.',
    'assets/images/coffee.png',
    'https://play.google.com/store/search?q=skonnect&c=apps&hl=en_IN&gl=US',
  ),
  Project(
    'Arena Owner',
    'This is a Flutter-based web app designed for arena owners. They can view their revenue, total bookings, which can be filtered by status and selected date. Arena owners can easily upload their profiles.',
    'assets/images/car.png',
    'https://partner-stg.skonnect.io/#/',
  ),
  Project(
      'All In One Bima Poster',
      'The Bima Poster app is helpful for superior work techniques in business. This app is very useful as an online marketing tool, creating attractive and effective posts for social media platforms like Facebook and WhatsApp.',
      'assets/images/alarm.jpg',
      'https://play.google.com/store/apps/details?id=com.allinonebimaposter.allinonebimaposter&hl=en-IN'),
  Project(
      'Bizalyz',
      'Bizalys is a simple and effective Practice Management Solution for small and medium sized firms of Chartered Accountants, Cost Accountants, Company Secretaries and Tax Consultants.',
      'assets/images/cui.png',
      'https://play.google.com/store/apps/details?id=com.biz.biznew&hl=en&gl=US'),
  Project(
      'Floormantra',
      'This app is a recognized & admired firm which is Real Estate consultancy in online marketing. Floormantra shows a new face in real estate industry through online marketing & helps property holder or agents to buy/sell/rent its commercial and residential property.',
      'assets/images/player.png',
      'https://play.google.com/store/apps/details?id=com.spectro.floormantra'),
];
