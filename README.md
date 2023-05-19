# Introduction to Computational and Data Sciences for Scientists (with R)

Online version of book at: https://cdsbook.github.io/book/

## Project structure

The book, tutorials, and slides share the same source .Rmd files in the `src` directory.

* Base shared content is in the `src/snippets` directory. 
* Chapter/tutorial files in the `src/book` and `src/tutorials` folders convert those into book chapters and interactive tutorials.
* Slides are in the `src/slides` directory.

## Building

By default the PDF will be built, using the `book` Quarto profile (`_quarto-book.yml`). To build the website, run:

```bash
quarto render --profile website
```

Add the `--cache-refresh` flag to rerun cached code chunks.

Note that this also allows [optional profile content](https://quarto.org/docs/projects/profiles.html#profile-content) via Quarto.


## Helpful reminders

### How to include figures directly or from code chunks

Either:

```
![Caption goes here](../img/rstudio_hello_world_output.png "Title: Optional title"){#fig-rstudio-helloworld, fig-alt="A drawing of an elephant." fig-align="left" width=20%}
```

or in an R code chunk using Quarto's syntax:

````r
```{r}
#| label: fig-line-plot
#| fig-cap: "A line plot "
knitr::include_graphics("../img/resid-vs-pred.png")
```
````

### Indexing

Add `\index{entry}` in text at places you want an index. Alternatively:

* `\index{hello!Peter}` to get a Peter sub-entry under "hello".
* `\index{Peter|see {hello}}` to get a cross-reference.
* `\index{Greeting|see {hello, Peter}}` to cross-reference a sub-entry.

More: https://en.wikibooks.org/wiki/LaTeX/Indexing

