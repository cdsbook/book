is_book = TRUE
is_tutorial = FALSE

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
    cat("
      :::{.callout-warning}
      ## Warning
      
      This chapter is a draft, and may be updated soon.
      :::
    ")
  } else if (chapter_status == "complete") {
    cat("
      :::{.callout-tip}
      ## Complete
      
      This chapter has been completed.
      :::
    ")
  }
  
}