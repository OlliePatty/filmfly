// class Preferences {
//   String? genreScores;
//   String? genrePref;
//   String? actorPref;
//   String? actorScores;
//   String? directorPref;
//   String? directorScores;
//   String? likedMovies;
//   String? dislikedMovies;
//   String? watchedRecently;

//   Preferences({this.genreScores, this.genrePref, this.actorPref, this.actorScores, this.directorPref, this.directorScores, this.likedMovies, this.dislikedMovies, this.watchedRecently});


// factory Preferences.fromJson(Map<String, dynamic> json) {
//     return Preferences(genreScores = json["genre_scores"],
//     genrePref = json["genre_pref"],
//     actorPref = json["actor_pref"],
//     actorScores = json["actor_scores"],
//     directorPref = json["director_pref"],
//     directorScores = json["director_scores"],
//     likedMovies = json["liked_movies"],
//     dislikedMovies = json["disliked_movies"],
//     watchedRecently = json["watched_recently"]);
    
//   }
// }