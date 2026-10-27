# IMDb Dataset Analysis Using SQL

An exploratory SQL project investigating movie ratings, directors, and actors/actresses using IMDb's public datasets.

## Research questions

1. Which directors, actresses, and actors have been involved with the most movies?
2. Which directors, actresses, and actors have the highest average rating for their movies?

---

## Research question 1: Who has been involved with the most movies?

### Methodology

- Joined the people, movie, and ratings datasets.
- Filtered title types to include movies only.
- Filtered movies to those with more than 50,000 votes.
- Ran separate queries for directors, actresses, and actors.
- Counted the number of movie titles associated with each person.
- Ranked directors, actresses, and actors by movie count.

### Results

#### Directors — Top 10

| Name | Birth year | Death year | Movie count |
|:--|--:|--:|--:|
| Steven Spielberg | 1946 | — | 31 |
| Ridley Scott | 1937 | — | 25 |
| Clint Eastwood | 1930 | — | 25 |
| Ron Howard | 1954 | — | 21 |
| Martin Scorsese | 1942 | — | 21 |
| Tim Burton | 1958 | — | 20 |
| Woody Allen | 1935 | — | 19 |
| Alfred Hitchcock | 1899 | 1980 | 18 |
| Steven Soderbergh | 1963 | — | 18 |
| Joel Coen | 1954 | — | 18 |

#### Actresses — Top 10

| Name | Birth year | Death year | Movie count |
|:--|--:|--:|--:|
| Scarlett Johansson | 1984 | — | 53 |
| Nicole Kidman | 1967 | — | 34 |
| Julia Roberts | 1967 | — | 33 |
| Julianne Moore | 1960 | — | 33 |
| Cate Blanchett | 1969 | — | 32 |
| Charlize Theron | 1975 | — | 31 |
| Meryl Streep | 1949 | — | 30 |
| Anne Hathaway | 1982 | — | 30 |
| Sigourney Weaver | 1949 | — | 29 |
| Emma Stone | 1988 | — | 29 |

#### Actors — Top 10

| Name | Birth year | Death year | Movie count |
|:--|--:|--:|--:|
| Robert De Niro | 1943 | — | 61 |
| Samuel L. Jackson | 1948 | — | 61 |
| Tom Hanks | 1956 | — | 51 |
| Willem Dafoe | 1955 | — | 49 |
| Nicolas Cage | 1964 | — | 48 |
| Bruce Willis | 1955 | — | 46 |
| Matt Damon | 1970 | — | 45 |
| Brad Pitt | 1963 | — | 45 |
| Ryan Reynolds | 1976 | — | 44 |
| Jason Statham | 1967 | — | 43 |

*Note: An em dash (—) indicates that IMDb does not provide a death year for that person.*

### Key findings

- Steven Spielberg has the highest movie count among the directors in this result set, with **31 movies**.
- Scarlett Johansson is the most represented actress in this result set, with **53 movies**.
- Robert De Niro and Samuel L. Jackson lead the actors list, with **61 movies each**.
- The top 10 actresses in this analysis have movie counts ranging from 29 to 53, compared with 43 to 61 for the top 10 actors. This may suggest a gender representation gap, which could be explored further. These lists alone do not establish the cause of the difference.

---

## Research question 2: Who has the highest average movie ratings?

### Methodology

The same general approach as Research Question 1 was used, with these changes:

- Included only directors, actresses, and actors with at least 5 qualifying movies.
- Calculated each person's average rating across their qualifying movies.
- Ranked people by average movie rating.

### Results

#### Directors — Top 10 by average rating

| Name | Birth year | Death year | Movie count | Average rating |
|:--|--:|--:|--:|--:|
| Sergio Leone | 1929 | 1989 | 5 | 8.34 |
| Charles Chaplin | 1889 | 1977 | 5 | 8.34 |
| Akira Kurosawa | 1910 | 1998 | 7 | 8.26 |
| Christopher Nolan | 1970 | — | 13 | 8.18 |
| Billy Wilder | 1906 | 2002 | 7 | 8.16 |
| Stanley Kubrick | 1928 | 1999 | 11 | 8.06 |
| Federico Fellini | 1920 | 1993 | 5 | 7.98 |
| Hayao Miyazaki | 1941 | — | 11 | 7.95 |
| Quentin Tarantino | 1963 | — | 13 | 7.92 |
| Denis Villeneuve | 1967 | — | 8 | 7.91 |

#### Actresses — Top 10 by average rating

| Name | Birth year | Death year | Movie count | Average rating |
|:--|--:|--:|--:|--:|
| Tabu | 1971 | — | 6 | 8.12 |
| Bibi Andersson | 1935 | 2019 | 5 | 8.08 |
| Yami Gautam | 1988 | — | 5 | 7.82 |
| Carrie Fisher | 1956 | 2016 | 8 | 7.80 |
| Carol Cleveland | 1942 | — | 6 | 7.78 |
| Audrey Hepburn | 1929 | 1993 | 5 | 7.72 |
| Catherine Deneuve | 1943 | — | 5 | 7.72 |
| Megumi Hayashibara | 1967 | — | 7 | 7.70 |
| Zendaya | 1996 | — | 9 | 7.63 |
| Teri Garr | 1944 | 2024 | 6 | 7.60 |

#### Actors — Top 10 by average rating

| Name | Birth year | Death year | Movie count | Average rating |
|:--|--:|--:|--:|--:|
| Sala Baker | 1976 | — | 5 | 8.44 |
| Charles Chaplin | 1889 | 1977 | 6 | 8.35 |
| Alec Guinness | 1914 | 2000 | 5 | 8.32 |
| Takashi Shimura | 1905 | 1982 | 6 | 8.27 |
| Toshirō Mifune | 1920 | 1997 | 6 | 8.25 |
| John Ratzenberger | 1947 | — | 6 | 8.22 |
| Sushant Singh Rajput | 1986 | 2020 | 5 | 8.20 |
| Claude Rains | 1889 | 1967 | 5 | 8.14 |
| Achyuth Kumar | 1966 | — | 5 | 8.14 |
| Thomas Mitchell | 1892 | 1962 | 5 | 8.12 |

### Key findings

- Sergio Leone and Charles Chaplin share the highest average rating among the directors shown, at **8.34**.
- Tabu has the highest average rating among the actresses shown, at **8.12**.
- Sala Baker has the highest average rating among the actors shown, at **8.44**.
- Several names in the top-rated lists are associated with older films, including Charles Chaplin, Akira Kurosawa, and Toshirō Mifune.
- In the results shown, 7 of the top 10 actors and 6 of the top 10 directors have passed away. This is an observation about these particular lists, not proof that older movies are generally rated more highly.

---

## Tools and techniques

- SQL joins
- Filtering with `WHERE`
- Aggregations using `COUNT` and `AVG`
- Grouping with `GROUP BY`
- Sorting and ranking with `ORDER BY`
- IMDb dataset exploration

## Data source

The analysis uses IMDb's publicly available datasets: [datasets.imdbws.com](https://datasets.imdbws.com/).

IMDb dataset usage is subject to IMDb's [official terms and conditions](https://help.imdb.com/article/imdb/general-information/can-i-use-imdb-data-in-my-software/G5JTRESSHJBBHTGX). This repository focuses on SQL analysis and summarized findings rather than redistributing the source datasets.
