# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#

articles = [
  %News.Article{
    "author": "Megan Geuss",
    "title": "As Irma approaches nuclear plants in Florida, lessons from Andrew resonate",
    "description": "Advance warning favors preparedness, but 1992 hurricane still ran up $90 million bill.",
    "url": "https://arstechnica.com/science/2017/09/as-irma-approaches-nuclear-plants-in-florida-lessons-from-andrew-resonate/",
    "url_to_image": "https://cdn.arstechnica.net/wp-content/uploads/2017/09/Screen-Shot-2017-09-09-at-7.16.53-AM-760x380.png"
  },
  %News.Article{
    "author": "Eric Berger",
    "title": "Key questions about Hurricane Irma on Saturday",
    "description": "The storm remains an extremely dangerous hurricane for parts of Florida.",
    "url": "https://arstechnica.com/science/2017/09/key-questions-about-hurricane-irma-on-saturday/",
    "url_to_image": "https://cdn.arstechnica.net/wp-content/uploads/2017/09/095407_5day_cone_with_line-2-760x380.png"
  },
  %News.Article{
    "author": "Timothy B. Lee",
    "title": "Lyft’s strategy: Be the Android of the self-driving car business",
    "description": "Lyft wants lots of self-driving car companies to build on its open network.",
    "url": "https://arstechnica.com/cars/2017/09/lyfts-ambitious-plans-to-win-the-self-driving-wars/",
    "url_to_image": "https://cdn.arstechnica.net/wp-content/uploads/2017/05/GettyImages-508246192-760x380.jpg"
  },
  %News.Article{
    "author": "Peter Bright",
    "title": "I’ve fallen in love with a laptop—the Lenovo ThinkPad X1 Yoga",
    "description": "Review: Lenovo has built the platonic ideal of a modern laptop.",
    "url": "https://arstechnica.com/gadgets/2017/09/ive-fallen-in-love-with-a-laptop-the-lenovo-thinkpad-x1-yoga/",
    "url_to_image": "https://cdn.arstechnica.net/wp-content/uploads/2017/09/lenovo-thinkpad-x1-yoga-gen-2-3-760x380.png"
  },
  %News.Article{
    "author": "Eric Berger",
    "title": "US forecast models have been pretty terrible during Hurricane Irma",
    "description": "NOAA's best weather model seems to be getting worse with hurricanes, not better.",
    "url": "https://arstechnica.com/science/2017/09/us-forecast-models-have-been-pretty-terrible-during-hurricane-irma/",
    "url_to_image": "https://cdn.arstechnica.net/wp-content/uploads/2017/09/ecmwf_uv10g_miami_10-760x380.png"
  },
  %News.Article{
    "author": "Annalee Newitz",
    "title": "The mysterious Voynich manuscript has finally been decoded",
    "description": "History researcher says that it's a mostly plagiarized guide to women's health.",
    "url": "https://arstechnica.com/science/2017/09/the-mysterious-voynich-manuscript-has-finally-been-decoded/",
    "url_to_image": "https://cdn.arstechnica.net/wp-content/uploads/2017/09/voynich2-760x380.png"
  },
  %News.Article{
    "author": "Jonathan M. Gitlin",
    "title": "As Irma nears, GIS data shows Florida emptying itself of planes",
    "description": "Flight, ship, and wind trackers visualize the hurricanes in real time these days.",
    "url": "https://arstechnica.com/information-technology/2017/09/the-last-flight-from-san-juan-a-data-story-of-hurricane-irma/",
    "url_to_image": "https://cdn.arstechnica.net/wp-content/uploads/2017/09/Screen-Shot-2017-09-08-at-2.29.09-PM-1-760x380.png"
  },
  %News.Article{
    "author": "Joe Mullin",
    "title": "The first man at trial over a “gig economy” job got dismantled on cross-examination [Updated]",
    "description": "“They’re taking advantage of people like me. We need to work, to pay rent.”",
    "url": "https://arstechnica.com/tech-policy/2017/09/plaintiff-suing-grubhub-admits-lying-on-application-barely-working-his-shifts/",
    "url_to_image": "https://cdn.arstechnica.net/wp-content/uploads/2017/09/lawson.2-665x380.jpg"
  },
  %News.Article{
    "author": "Sean Gallagher",
    "title": "So, Equifax says your data was hacked—now what?",
    "description": "143 million now face identity theft threat, so here's what to do if you're one of them.",
    "url": "https://arstechnica.com/information-technology/2017/09/so-equifax-says-your-data-was-hacked-now-what/",
    "url_to_image": "https://cdn.arstechnica.net/wp-content/uploads/2017/09/GettyImages-844182436-760x380.jpg"
  },
  %News.Article{
    "author": "John Timmer",
    "title": "Many nicknames for Pluto’s features are now official",
    "description": "Explorers, astronomers, and underworld figures donate names to features.",
    "url": "https://arstechnica.com/science/2017/09/its-official-tenzig-norgay-sputnik-honored-with-features-on-pluto/",
    "url_to_image": "https://cdn.arstechnica.net/wp-content/uploads/2017/09/iau1704a-760x380.jpg"
  }
]

articles |> Enum.map(&News.Repo.insert!/1)

#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
