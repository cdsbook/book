old_path <- "src/assets"
new_path <- "docs"

file.copy(
  from = old_path, 
  to = new_path, 
  recursive = TRUE, 
  overwrite = TRUE
  )