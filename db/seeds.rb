# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

artists = Artist.create([
  { name: "Ed Sheeran " },
  { name: "Forest Blakk"},
  { name: "Tori Harper"},
  { name: "John Mayer"},
  { name: "Matt Kearney"}
]);

albums = Album.create([
  { title: 'Divide', year: '2017', condition: 'great', artist_id: artists[0].id},
  { title: 'X', year: '2014', condition: 'moderate', artist_id: artists[0].id},
  { title: 'Love Me', year: '2018', condition: 'mint', artist_id: artists[1].id},
  { title: 'Seasons', year: '2018', condition: 'mint', artist_id: artists[2].id},
  { title: 'Paradise Valley', year: '2013', condition: 'good', artist_id: artists[3].id},
  { title: 'Battle Studies', year: '2009', condition: 'ok', artist_id: artists[3].id},
  { title: 'Continuum', year: '2006', condition: 'great', artist_id: artists[3].id},
  { title: 'Crazytalk', year: '2018', condition: 'mint', artist_id: artists[4].id},
  { title: 'Just Kids', year: '2015', condition: 'good', artist_id: artists[4].id},
  { title: 'Young Love', year: '2011', condition: 'new', artist_id: artists[4].id},
  { title: 'City of Black & White', year: '2009', condition: 'perfect', artist_id: artists[4].id}
]);
