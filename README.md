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

Add the `--cache-refresh` flag to rerun cached code chunks.

Note that this also allows [optional profile content](https://quarto.org/docs/projects/profiles.html#profile-content) via Quarto.


### Indexing

Add `\index{entry}` in text at places you want an index. Alternatively:

* `\index{hello!Peter}` to get a Peter sub-entry under "hello".
* `\index{Peter|see {hello}}` to get a cross-reference.
* `\index{Greeting|see {hello, Peter}}` to cross-reference a sub-entry.

More: https://en.wikibooks.org/wiki/LaTeX/Indexing
