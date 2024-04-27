class ExperienceModel {
  final String name;
  final String organization;
  final String date;
  final String skills;
  final String website;
  final List<String> responsibilities;

  ExperienceModel({
    required this.name,
    required this.organization,
    required this.date,
    required this.skills,
    required this.website,
    required this.responsibilities,
  });
}

List<ExperienceModel> experienceList = [
  ExperienceModel(
      name: 'SportsKingdom India Pvt. Ltd',
      organization: 'Dhanori, Pune',
      date: '07/08/2023  –  Current',
      skills: 'Flutter . Dart . Rest API\'s',
      website: 'https://www.sportskingdom.io/',
      responsibilities: [
        'Technology/Tools: Flutter [Mobile,Web] , JAVA, Gitlab, Figma.',
        'Worked on REST API, Stripe payment gateway.',
        'Implementation of various third-party libraries'
      ]),
  ExperienceModel(
      name: 'Innover Infotech Pvt. Ltd',
      organization: 'Kothrud, Pune',
      date: '12/04/2021  –  04/08/2023',
      skills: 'Flutter .Rest API\'s . Android Development',
      website: 'https://innoverinfotech.com/',
      responsibilities: [
        'Technology/Tools: Android , Flutter, Git, Figma.',
        'Launching app on Google play store.',
        'Worked on plugins like charts, calender'
      ]),
  ExperienceModel(
      name: 'Apptware Solutions LLP',
      organization: 'Baner, Pune',
      date: '01/01/2020  –  27/02/2021',
      skills: 'Flutter . Dart . Rest API\'s',
      website: 'https://apptware.com/',
      responsibilities: [
        'Technology/Tools: Flutter, Git, Figma.',
        'Worked on e-commerce applications.',
        'Worked on firebase notifications,google map.'
      ]),
  ExperienceModel(
      name: 'Unitglo Solutions Pvt. Ltd',
      organization: 'Chinchwad, Pune',
      date: '05/08/2019  –  31/12/2019',
      skills: 'Android . Flutter',
      website: 'https://www.unitglo.com/web/',
      responsibilities: [
        'Technology/Tools: Android, Flutter',
        'Worked on e-commerce app in android',
        'Performed testing on the physical device and the emulator.'
      ]),
];
