# Introduction to Computational and Data Sciences for Scientists (with R)

Online version of book at: https://cdsbook.github.io/book/

## Project structure

The book, tutorials, and slides share the same source .Rmd files in the `src` directory.

* Base shared content is in the `src/snippets` directory. 
* Chapter/tutorial files in the `src/book` and `src/tutorials` folders convert those into book chapters and interactive tutorials.
* Slides are in the `src/slides` directory.

## Building

By default the web version will be built, using the `website` Quarto profile (`_quarto-book.yml`). To build the book, run:

```bash
quarto render --profile book
```

Add the `--cache-refresh` flag to rerun cached code chunks.

To build a single website chapter (although note that it will not include menus, etc., and it will be in the `src/book` folder:

```bash
quarto render src/book/04_rmarkdown_chapter.qmd --profile website --cache-refresh
```

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

### Callout blocks

* note (blue, icon = info i circle)
* warning (orange, icon = triangle hazard exclamation)
* important (red, icon = info i circle)
* tip (green, icon = lightbulb)
* caution (orange, icon = construction cone)

Example (note that this will collapse the tip):

```
::: {.callout-tip collapse="true"}
## Tip with Title

This is an example of a callout with a title.
:::
```

Note that to output a block like this from a code chunk, that chunk needs the `results = "asis"` option (RMarkdown) or the `#| results: "asis"` option (Quarto).


### TODO Comments

Add using the `pdf_dev_comment()` function, e.g.

    ```{r, echo=FALSE, results='asis'}
    pdf_dev_comment("TODO: something that needs doing")
    ```

### Indexing

Add `\index{entry}` in text at places you want an index. Alternatively:

* `\index{hello!Peter}` to get a Peter sub-entry under "hello".
* `\index{Peter|see {hello}}` to get a cross-reference.
* `\index{Greeting|see {hello, Peter}}` to cross-reference a sub-entry.

More: https://en.wikibooks.org/wiki/LaTeX/Indexing


### Highlighting with `flair`

Only in html outputs, and doesn't currently work with Quarto: https://r-for-educators.github.io/flair/index.html


### Exercises

Provide via functions (see `quarto_tests` project for development) that automatically render appropriately for each output target:

* Web book: `webexercises`
* PDF: text (plus answers at end of each chapter)
* Interactive tutorials: `learnr` and `grader`

TODO: implement rendering of all exercise types for PDF & interactive tutorial. Create shared code for formatting hints, explanation, and exercise blocks across exercise types.

#### Exercise examples

Note that all exercise code chunks should contain the options: `echo=FALSE, results='asis'`

True or false:

    ```{r, echo=FALSE, results='asis'}
    render_true_or_false(
      "Is it true or false?",
      TRUE,
      hints = c("Some test hint"),
      explanation = "Test expl"
    )
    ```

Typed answer:

    ```{r, echo=F, results='asis'}
    render_blank_answer(
      "What function creates an empty `ggplot2` graph?",
      answers = c("ggplot", "ggplot( )"),
      fitb_options = list(),
      hints = c("What's the function you always need to start a ggplot graph with?"),
      explanation = c("We always start a ggplot graph with the `ggplot()` function, and then add other function such as geom functions, onto this.")
    )
    ```

Multiple choice:

  ```{r, echo=FALSE, results='asis'}
  render_multiple_choice(
    "What about this?", 
    answers = c(
      "Answer 1",
      "Answer 2",
      answer = "Answer 3",
      "Answer 4"
      ), 
    hints = c("Some hint 1 text", "A second hint", "Even a third hint!"), 
    "Some explanation about why the correct answer is correct."
   )
  ```

Code fill-in-the-blanks (also accepts `hints` vector and `explanation` character string):

    ```{r, echo=FALSE, results='asis'}
    render_code_blanks(
      "Some explanation about what to fill in",
    "df %>%
      ______() +
      geom_histogram(mapping = ______(x = ______))",
      answers = list(
        list(c("ggplot"), width=10),
        list(c(answer = "aes", "ggplot", "geom_histogram", "col1")),
        list("^[a-zA-Z]{3}$", width = 3, regex = TRUE)
      ),
      blank_types <- c("fitb", "mcq", "fitb")
    )
    ```

### Footnotes

From the Quarto documentation:

```
Here is a footnote reference,[^1] and another.[^longnote]

[^1]: Here is the footnote.

[^longnote]: Here's one with multiple blocks.

    Subsequent paragraphs are indented to show that they
belong to the previous footnote.
```


Footnotes can also be inline, e.g. from the Quarto docs

```
Here is an inline note.^[Inlines notes are easier to write,
since you don't have to pick an identifier and move down to
type the note.]
```

### Conditional execution for different formats

Conditional execution by output type: https://community.rstudio.com/t/set-options-conditional-on-output-formats-in-quarto/168989/2

