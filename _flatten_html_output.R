# Modified from:
# https://stackoverflow.com/questions/78932963/flatten-subdirectories-of-output-files-in-quarto

library(tidyverse)

out_dir <-
  Sys.getenv("QUARTO_PROJECT_OUTPUT_DIR") |>
  fs::path_tidy()

# print(out_dir)

out_files <-
  strsplit(Sys.getenv("QUARTO_PROJECT_OUTPUT_FILES"), "\n")[[1]] |>
  fs::path_tidy()

# Function to replace strings in a file
replace_strings_in_file <- function(file_path, patterns, replacement) {
  # Read the file content
  file_content <- readLines(file_path, warn = FALSE)
  # Replace the patterns with the replacement
  for (pattern in patterns) {
    file_content <- gsub(pattern, replacement, file_content)
  }
  # Write the updated content back to the file
  writeLines(file_content, file_path)
}

# Patterns to replace
patterns <- c('../../', 'src/book/')
# Replacement string
replacement <- ""

# Iterate over each file in the vector and apply the replacement
for (file in c(out_files, fs::path_join(c(Sys.getenv("QUARTO_PROJECT_OUTPUT_DIR"),"search.json")))) {
  if (file.exists(file)) {
    replace_strings_in_file(file, patterns, replacement)
    cat(paste("Processed file:", file, "\n"))
  } else {
    cat(paste("File not found:", file, "\n"))
  }
}


# out_files %>% write_lines("example_output.txt")
# get all the asset files for every chapter
assets <- 
  out_files |> 
  grep("\\.html$", x = _, value = TRUE) |> 
  gsub("\\.html$", "_files", x = _)
assets <- assets[fs::dir_exists(assets)]

fs::file_move(out_files, out_dir)#, overwrite = TRUE)
fs::dir_copy(assets, fs::path(out_dir, fs::path_file(assets)), overwrite = TRUE)
