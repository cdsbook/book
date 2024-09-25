library(knitr)
library(webexercises)

render_multiple_choice <- function(question_text, answers, hints = c(), explanation = NA){
  evaluation_env <- list2env(
    x = list(
      question_text = question_text, 
      answers = answers, 
      hints = hints, 
      explanation = explanation
    ), 
    parent = as.environment(2)
  )
  if(is_webbook){
    res <- knit_child(
      "../exercise_templates/template_webbook_multiple_choice_qanda.Rmd",
      envir = evaluation_env,
      quiet = TRUE
    )
    cat(res, sep = '\n')
  } else if(is_pdf){
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
  evaluation_env <- list2env(
    x = list(
      question_text = question_text, 
      answers = answers,
      fitb_options= fitb_options,
      hints = hints, 
      explanation = explanation
    ), 
    parent = as.environment(2)
  )
  if(is_webbook){
    res <- knit_child(
      "../exercise_templates/template_webbook_blank_answer.Rmd",
      envir = evaluation_env,
      quiet = TRUE
    )
    cat(res, sep = '\n')
  } else if(is_pdf){
    # res <- knit_child(
    #   "template_pdf_multiple_choice_qanda.Rmd",
    #   envir = evaluation_env,
    #   quiet = TRUE
    # )
    # cat(res, sep = '\n')
    cat(question_text, ": Exercise not yet implemented.\n")
  }
}


render_true_or_false <- function(question_text, answer, hints = c(), explanation = NA){
  evaluation_env <- list2env(
    x = list(
      question_text = question_text, 
      answer = answer,
      hints = hints, 
      explanation = explanation
    ), 
    parent = as.environment(2)
  )
  if(is_webbook){
    res <- knit_child(
      "../exercise_templates/template_webbook_true_or_false.Rmd",
      envir = evaluation_env,
      quiet = TRUE
    )
    cat(res, sep = '\n')
  } else if(is_pdf){
    # res <- knit_child(
    #   "template_pdf_multiple_choice_qanda.Rmd",
    #   envir = evaluation_env,
    #   quiet = TRUE
    # )
    # cat(res, sep = '\n')
    cat(question_text, ": Exercise not yet implemented.\n")
  }
}

render_code_blanks <- function(question_text, code_template, answers, blank_types, hints = c(), explanation = NA){
  evaluation_env <- list2env(
    x = list(
      question_text = question_text, 
      code_template = code_template,
      answers = answers,
      blank_types = blank_types,
      hints = hints, 
      explanation = explanation
    ), 
    parent = as.environment(2)
  )
  if(is_webbook){
    res <- knit_child(
      "../exercise_templates/template_webbook_code_blanks.Rmd",
      envir = evaluation_env,
      quiet = TRUE
    )
    cat(res, sep = '\n')
  } else if(is_pdf){
    # res <- knit_child(
    #   "template_pdf_multiple_choice_qanda.Rmd",
    #   envir = evaluation_env,
    #   quiet = TRUE
    # )
    # cat(res, sep = '\n')
    cat(question_text, ": Exercise not yet implemented.\n")
  }
}


