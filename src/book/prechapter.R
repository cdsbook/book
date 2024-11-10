is_book = TRUE
is_tutorial = FALSE

if(knitr::is_html_output()) {
  is_webbook = TRUE
  is_pdf = FALSE
} else{
  is_webbook = FALSE
  is_pdf = TRUE
}

# knitr::opts_chunk$set(echo = TRUE, class.output="shadebox")

insert_status_callout <- function(chapter_status = c("incomplete", "draft", "complete")) {
  chapter_tips = c("incomplete" = "important", "draft" = "warning", "complete" = "tip")
  if (chapter_status == "incomplete") {
    cat(paste0(
      ":::{.callout-important}\n",
      "## Warning\n",
      "\n",
      "This chapter is in an early draft form, and is incomplete.\n",
      ":::\n"
   ))
  } else if (chapter_status == "draft") {
    cat(paste0(
    ":::{.callout-warning}\n",
    "## Warning\n",
    "\n",
    "This chapter is a draft, and may be updated soon.\n",
    ":::\n"
    ))
  } else if (chapter_status == "complete") {
    cat(paste0(
      ":::{.callout-tip}\n",
      "## Complete\n",
      "\n",
      "This chapter has been completed.\n",
      ":::\n"
    ))
  }
}

pdf_dev_comment <- function(todo){
  cat(
"
::: {.callout-caution}
# TODO

",
todo,"\n\n",knitr::current_input(),
"

:::"
  )
}