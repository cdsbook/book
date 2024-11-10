library(knitr)
library(webexercises)

create_hints <- function(hints) {
  hint_text <- ""
  hint_counter <- 1
  for (hint in hints){
    if (length(hints) > 1) {
      nhint <- paste0(" ", as.character(hint_counter))
    } else{
      nhint <- ""
    }
    hint_text <- paste0(
      hint_text,
      '

::: {.exercise-hint .callout-warning collapse="true" appearance="simple" icon=false title="Hint', nhint,'"}

', hint,
      '
:::

'
    )
    hint_counter <- hint_counter + 1
  }
  return(hint_text)
}

create_explanation <- function(explanation) {
  if (!is.na(explanation)) {
    explanation_text <- paste0(
      '

::: {.exercise-explanation .callout-tip collapse="true" title="Explanation"}

', explanation,
      '
:::

'
    )
  } else{
    explanation_text <- ""
  }
  return(explanation_text)
}

create_pre_exercise <- function() {
  return(
':::: {.exercise .callout-note appearance="simple" icon=false}
**Exercise:**'
  )
}

create_post_exercise <- function(hints, explanation) {
  return(
    paste0(
"\n\n", create_hints(hints), "\n\n", create_explanation(explanation), "\n\n",
'
::::
'
    )
  )
}

render_multiple_choice <- function(question_text, answers, hints = c(), explanation = NA){
  # evaluation_env <- list2env(
  #   x = list(
  #     question_text = question_text, 
  #     answers = answers, 
  #     hints = hints, 
  #     explanation = explanation,
  #     create_pre_exercise = create_pre_exercise,
  #     create_post_exercise = create_post_exercise
  #   ), 
  #   parent = as.environment(2)
  # )
  if(is_webbook){
    # res <- knit_child(
    #   "../exercise_templates/template_webbook_multiple_choice_qanda.Rmd",
    #   envir = evaluation_env,
    #   quiet = TRUE
    # )
    # cat(res, sep = '\n')
    
    if (max(nchar(answers)) > 16){
      q <- longmcq(answers)
    } else{
      q <- mcq(answers)
    }
    cat(
      create_pre_exercise(), 
      question_text, q, 
      create_post_exercise(hints, explanation)
    )
  } else if(is_pdf){
    # TODO: refactor to remove template, as with web book version
    res <- knit_child(
      "../exercise_templates/template_pdf_multiple_choice_qanda.Rmd",
      envir = evaluation_env,
      quiet = TRUE
    )
    cat(res, sep = '\n')
  }
}


render_blank_answer <- function(question_text, answers, fitb_options = list(), hints = c(), explanation = NA){
  # Defaults for webexercises::fitb
  # fitb_options = list(
  #   width = ?, <- useful if regex, or if answer can include spaces
  #   regex = FALSE, <- set to TRUE is answer is regex
  #   ignore_case = FALSE, 
  #   ignore_ws = TRUE  <- in answers, include white space anywhere it is possible, e.g. "library( \"tidyverse\" )"
  # )
  if(is_webbook){
    q <- do.call(fitb, c(list(answers), fitb_options))
    
    cat(
      create_pre_exercise(), 
      question_text, q, 
      create_post_exercise(hints, explanation)
    )
  } else if(is_pdf){
    cat(question_text, ": Exercise not yet implemented.\n")
  }
}


render_true_or_false <- function(question_text, answer, hints = c(), explanation = NA){
  if(is_webbook){
    q <- torf(answer)
    cat(
      create_pre_exercise(), 
      question_text, q, 
      create_post_exercise(hints, explanation)
    )
  } else if(is_pdf){
    cat(question_text, ": Exercise not yet implemented.\n")
  }
}

render_code_blanks <- function(question_text, code_template, answers, blank_types, hints = c(), explanation = NA){
  if(is_webbook){
    code_parts <- str_split_1(code_template, "______")
    cat(
      create_pre_exercise(), 
      question_text,
"<div>
<pre class='r' style='background-color: rgba(233,236,239,.65); padding: 10px;'>
"
    )
    for (i in 1:length(code_parts)){
      cat(code_parts[i])
      if (i < length(code_parts)) {
        if (blank_types[i] == "fitb"){
          cat(do.call(fitb, answers[[i]]))
        } else if (blank_types[i] == "mcq"){
          cat(do.call(mcq, answers[[i]]))
        }
      }
    }
    cat(
"
</pre>
</div>

",
      create_post_exercise(hints, explanation)
    )
  } else if(is_pdf){
    cat(question_text, ": Exercise not yet implemented.\n")
  }
}


