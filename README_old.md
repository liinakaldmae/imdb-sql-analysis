# imdb-sql-analysis
IMDb Dataset analysis using SQL

An exploratory SQL project investigating movie ratings, directors and actors/actresses from IMDb's public datasets.

I had 2 research questions for directors/actresses/actors:

Research question 1: Which directors/actresses/actors have been involved with the most movies?

Methodology
- Joined the people, movie and ratings datasets.
- Filtered title types to only get movies
- Filtered movies to those with more than 50,000 votes.
- Filtered to only include directors/actresses/actors (3 different queries).
- Calculated each director's/actress's/actor's number of movies (counting titleID-s).
- Ranked directors/actresses/actors by movie count.

Results
Directors TOP10:
┌───────────────────────┬───────────┬───────────┬────────────┐
│      primaryName      │ birthYear │ deathYear │ TitleCount │
│        varchar        │  varchar  │  varchar  │   int64    │
├───────────────────────┼───────────┼───────────┼────────────┤
│ Steven Spielberg      │ 1946      │ \N        │         31 │
│ Ridley Scott          │ 1937      │ \N        │         25 │
│ Clint Eastwood        │ 1930      │ \N        │         25 │
│ Ron Howard            │ 1954      │ \N        │         21 │
│ Martin Scorsese       │ 1942      │ \N        │         21 │
│ Tim Burton            │ 1958      │ \N        │         20 │
│ Woody Allen           │ 1935      │ \N        │         19 │
│ Alfred Hitchcock      │ 1899      │ 1980      │         18 │
│ Steven Soderbergh     │ 1963      │ \N        │         18 │
│ Joel Coen             │ 1954      │ \N        │         18 │

Actresses TOP10:
┌──────────────────────┬───────────┬───────────┬────────────┐
│     primaryName      │ birthYear │ deathYear │ TitleCount │
│       varchar        │  varchar  │  varchar  │   int64    │
├──────────────────────┼───────────┼───────────┼────────────┤
│ Scarlett Johansson   │ 1984      │ \N        │         53 │
│ Nicole Kidman        │ 1967      │ \N        │         34 │
│ Julia Roberts        │ 1967      │ \N        │         33 │
│ Julianne Moore       │ 1960      │ \N        │         33 │
│ Cate Blanchett       │ 1969      │ \N        │         32 │
│ Charlize Theron      │ 1975      │ \N        │         31 │
│ Meryl Streep         │ 1949      │ \N        │         30 │
│ Anne Hathaway        │ 1982      │ \N        │         30 │
│ Sigourney Weaver     │ 1949      │ \N        │         29 │
│ Emma Stone           │ 1988      │ \N        │         29 │

Actors TOP10:
┌─────────────────────┬───────────┬───────────┬────────────┐
│     primaryName     │ birthYear │ deathYear │ TitleCount │
│       varchar       │  varchar  │  varchar  │   int64    │
├─────────────────────┼───────────┼───────────┼────────────┤
│ Robert De Niro      │ 1943      │ \N        │         61 │
│ Samuel L. Jackson   │ 1948      │ \N        │         61 │
│ Tom Hanks           │ 1956      │ \N        │         51 │
│ Willem Dafoe        │ 1955      │ \N        │         49 │
│ Nicolas Cage        │ 1964      │ \N        │         48 │
│ Bruce Willis        │ 1955      │ \N        │         46 │
│ Matt Damon          │ 1970      │ \N        │         45 │
│ Brad Pitt           │ 1963      │ \N        │         45 │
│ Ryan Reynolds       │ 1976      │ \N        │         44 │
│ Jason Statham       │ 1967      │ \N        │         43 │

Key findings

Steven Spielberg stands out as the director with the biggest number of movies - 31.
Scarlett Johansson has been by far the most active actress, having appeared in 53 movies.
Among actors, Robert De Niro and Samuel L. Jackson have been in most movies (both in 61).

What stood out was also that TOP10 women had noticeably smaller number of movies than TOP10 men (ranging from 29-53 movies compared to 43-61 among men). This could mean that men are more represented in movies than women and could be an interesting subject for a further analysis


Research question 2: Which directors/actresses/actors have the highest average rating for their movies?

Methodology
- Sames as for research question 1, except:
  - Included only directors/actresses/actors with movie count 5 or higher.
  - Calculated each director's/actress's/actor's average rating across all their movies.
  - Ranked directors/actresses/actors by their average movie rating.
 
Results
Directors TOP10:
┌───────────────────────┬───────────┬───────────┬────────────┬───────────┐
│      primaryName      │ birthYear │ deathYear │ TitleCount │ AvgRating │
│        varchar        │  varchar  │  varchar  │   int64    │  double   │
├───────────────────────┼───────────┼───────────┼────────────┼───────────┤
│ Sergio Leone          │ 1929      │ 1989      │          5 │      8.34 │
│ Charles Chaplin       │ 1889      │ 1977      │          5 │      8.34 │
│ Akira Kurosawa        │ 1910      │ 1998      │          7 │      8.26 │
│ Christopher Nolan     │ 1970      │ \N        │         13 │      8.18 │
│ Billy Wilder          │ 1906      │ 2002      │          7 │      8.16 │
│ Stanley Kubrick       │ 1928      │ 1999      │         11 │      8.06 │
│ Federico Fellini      │ 1920      │ 1993      │          5 │      7.98 │
│ Hayao Miyazaki        │ 1941      │ \N        │         11 │      7.95 │
│ Quentin Tarantino     │ 1963      │ \N        │         13 │      7.92 │
│ Denis Villeneuve      │ 1967      │ \N        │          8 │      7.91 │

Actresses TOP10:
┌──────────────────────────┬───────────┬───────────┬────────────┬───────────┐
│       primaryName        │ birthYear │ deathYear │ TitleCount │ AvgRating │
│         varchar          │  varchar  │  varchar  │   int64    │  double   │
├──────────────────────────┼───────────┼───────────┼────────────┼───────────┤
│ Tabu                     │ 1971      │ \N        │          6 │      8.12 │
│ Bibi Andersson           │ 1935      │ 2019      │          5 │      8.08 │
│ Yami Gautam              │ 1988      │ \N        │          5 │      7.82 │
│ Carrie Fisher            │ 1956      │ 2016      │          8 │       7.8 │
│ Carol Cleveland          │ 1942      │ \N        │          6 │      7.78 │
│ Audrey Hepburn           │ 1929      │ 1993      │          5 │      7.72 │
│ Catherine Deneuve        │ 1943      │ \N        │          5 │      7.72 │
│ Megumi Hayashibara       │ 1967      │ \N        │          7 │       7.7 │
│ Zendaya                  │ 1996      │ \N        │          9 │      7.63 │
│ Teri Garr                │ 1944      │ 2024      │          6 │       7.6 │

Actors TOP10:
┌──────────────────────┬───────────┬───────────┬────────────┬───────────┐
│     primaryName      │ birthYear │ deathYear │ TitleCount │ AvgRating │
│       varchar        │  varchar  │  varchar  │   int64    │  double   │
├──────────────────────┼───────────┼───────────┼────────────┼───────────┤
│ Sala Baker           │ 1976      │ \N        │          5 │      8.44 │
│ Charles Chaplin      │ 1889      │ 1977      │          6 │      8.35 │
│ Alec Guinness        │ 1914      │ 2000      │          5 │      8.32 │
│ Takashi Shimura      │ 1905      │ 1982      │          6 │      8.27 │
│ Toshirō Mifune       │ 1920      │ 1997      │          6 │      8.25 │
│ John Ratzenberger    │ 1947      │ \N        │          6 │      8.22 │
│ Sushant Singh Rajput │ 1986      │ 2020      │          5 │       8.2 │
│ Claude Rains         │ 1889      │ 1967      │          5 │      8.14 │
│ Achyuth Kumar        │ 1966      │ \N        │          5 │      8.14 │
│ Thomas Mitchell      │ 1892      │ 1962      │          5 │      8.12 │

Key findings

Charles Chaplin stands out as one of the TOP directors and actors of all time. There are also quite a few Japanese names in the TOP like Takashi Shimura, Toshirō Mifune and Akira Kurosawa. 

It is also interesting to note that 7 out of 10 TOP actors (and 6 out of 10 TOP directors) have passed away, so the movies with the high ratings are more likely to be old. 






