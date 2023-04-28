# Introduction to Computational and Data Sciences for Scientists (with R)

_Book and Tutorials_

## Project structure

The book and tutorials share the same source .Rmd files in the `src` directory.

Base content is in the `src/snippets` directory. Then chapter/tutorial files in the `src/book` and `src/tutorials` folders convert those into book chapters and interactive tutorials.

## Building

By default the PDF will be built, using the `book` Quarto profile (`_quarto-book.yml`). To build the website, run:

```bash
quarto render --profile website
```

Note that this also allows [optional profile content](https://quarto.org/docs/projects/profiles.html#profile-content) via Quarto.

