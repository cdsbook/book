# Introduction to Computational and Data Sciences for Scientists (with R)

_Book and Tutorials_

## TODO
* General:
    * Improve tutorial autograder grading checks.
* Intro to R chapter:
    * Add intro to packages.
    * Exercise: students can download the book R package and run a function to get the invite to the book Discord community.
* Visualization chapter: 
    * Write from scratch with `plot()` function and record new videos.
    * New exercises.
* Wrangling chapter:
    * Add book versions of exercises
    * Record new videos.
    * Remove unusual/obscure functions.
    * Add functions to join tables.

## Project structure

The book and tutorials share the same source .Rmd files in the `src` directory.

Base content is in the `src/snippets` directory. Then chapter/tutorial files in the `src/book` and `src/tutorials` folders convert those into book chapters and interactive tutorials.

## Building

By default the PDF will be built, using the `book` Quarto profile (`_quarto-book.yml`). To build the website, run:

```bash
quarto render --profile website
```

Note that this also allows [optional profile content](https://quarto.org/docs/projects/profiles.html#profile-content) via Quarto.

