class PasswordTileContent{
  final int id;
  final String website;
  final String passwordContent;
  final DateTime whenSet;

  PasswordTileContent({required this.id, required this.website, required this.passwordContent, required this.whenSet});
}

List <PasswordTileContent> samplePasswords = [
  PasswordTileContent(
    id: 0,
    website: "Google",
    passwordContent: "gie2\$fpd!",
    whenSet: DateTime(2022, 3, 5, 6, 30)
  ),
  PasswordTileContent(
    id: 1,
    website: "Yahoo!",
    passwordContent: "ewb2h3b",
    whenSet: DateTime(2022, 5, 5, 19, 22)
  ),
  PasswordTileContent(
    id: 2,
    website: "Youtube",
    passwordContent: "bwr@323gsc",
    whenSet: DateTime(2023, 6, 1, 8, 1)
  )
];