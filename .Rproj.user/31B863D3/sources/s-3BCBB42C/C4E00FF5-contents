# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'


# Creating help file --------------------------------------------------------

#' Translate
#'
#' @description Translates text into a target language. Uses Deepl API
#' (https://www.deepl.com/) to provide high quality translations.
#' 
#' @param input_text String to be translated.
#'
#' @param target_language Language code of language user wishes to translate 
#' sentence to. Current target language options are: "BG”  (Bulgarian), "CS" 
#' (Czech), "DA" (Danish), "DE" (German), "EL" (Greek), "EN-GB" (British English), 
#' "EN-US" (American English), "ES" (Spanish), "ET" (Estonian), "FI" (Finnish), 
#' "FR" (French), "HU" (Hungarian), "ID" (Indonesian), "IT" (Italian), "JA" 
#' (Japanese), "LT" (Lithuanian), "LV" (Latvian), "NL" (Dutch), "PL" (Polish), 
#' "PT-PT" (Portuguese), "PT-BR" (Brazilian Portuguese), "RO" (Romanian), "RU" 
#' (Russian), "SK" (Slovak), "SL" (Slovenian), "SV" (Swedish), "TR" (Turkish), 
#' and "ZH" (Chinese).
#' 
#' @param source_language Optional argument to set the language of the 
#' \code{input_text}. If not specified, function will attempt to automatically 
#' recognise language. Current target language options are: "BG”  (Bulgarian), 
#' "CS" (Czech), "DA" (Danish), "DE" (German), "EL" (Greek), "EN" (all English 
#' varieties), "ES" (Spanish), "ET" (Estonian), "FI" (Finnish), "FR" (French), 
#' "HU" (Hungarian), "ID" (Indonesian), "IT" (Italian), "JA" (Japanese), "LT" 
#' (Lithuanian), "LV" (Latvian), "NL" (Dutch), "PL" (Polish), "PT" (all 
#' Portuguese varieties), "RO" (Romanian), "RU" (Russian), "SK" (Slovak), "SL" 
#' (Slovenian), "SV" (Swedish), "TR" (Turkish), and "ZH" (Chinese).
#' 
#' @param formality Optional argument to determine whether the translation should 
#' be more formal or informal. The possible options are "default" (default), 
#' "more" for a more formal language, and "less" for a more informal language. 
#' This currently only works for the following languages: "DE" (German), "FR" 
#' (French), "IT" (Italian), "ES" (Spanish), "NL" (Dutch), "PL" (Polish), "PT-PT", 
#' "PT-BR" (Portuguese), and "RU" (Russian). 
#' 
#' @param preserve_formatting Optional argument to determine whether the translator
#' should respect the original formatting of the \code{input_text}. Possible 
#' aspects affected by this formatting include punctuation and upper or lower 
#' cases at the start and end of sentences. Possible options are 1 (default) for 
#' preserving formatting of \code{input_text}, or 0 for possibly changing the formatting.
#' 
#' @return \code{'input text'}, \code{'source_language'} (specified by user or 
#' automatically detected), \code{'output text'} (translated version of input text, 
#' and \code{'target language'}.
#'
#' @examples 
#' translate("Hello world!", "FR", "EN")
#' 
#' translate("The brown fox jumped over the black cat.", "PT-PT", 
#'            formality = "more")
#' 
#' translate("i forgot about it. no i have to go back", "RU", "EN", 
#'            formality = "less", split_sentences = 0, preserve_formatting = 1)




# Translate Function ---------------------------------------------------------
#' @export
translate <- function(input_text, 
                      target_language, 
                      source_language = "NULL", 
                      formality = "default",  
                      preserve_formatting = 1) {
  
  # Check that all arguments are of correct type 
  if(!is.character(input_text)) {
    stop("Argument 'text' must be a string.")
  }
  
  if(!is.character(target_language)) {
    stop("Argument 'target_language' must be a string.")
  }
  
  if(!is.character(source_language)) {
    stop("Argument 'source_language' must be a string.")
  }
  
  if(!is.character(formality)) {
    stop("Argument 'formality' must be a string.")
  }
  
  # had to change it to string inputs to work in shiny
  #if(!is.numeric(preserve_formatting) && !is.character(preserve_formatting) ) {
   # stop("Argument 'preserve_formatting' must be valid number or string.")
  #}
  
  
  # Check that argument 2, 3 and 4 are from correct language codes list 
  lang_codes_output <- c("BG", "CS", "DA", "DE", "EL", "EN-GB", "EN-US", "ES", "ET", 
                         "FI", "FR", "HU", "ID", "IT", "JA", "LT", "LV", "NL", "PL", 
                         "PT-PT", "PT-BR", "RO", "RU", "SK", "SL", "SV", "TR", "ZH")
  
  if((target_language %in% lang_codes_output) == FALSE) {
    stop("Argument 'target_language' must be an available language code. 
         Check help file for more information.")
  }
  
  lang_codes_input <- c("BG", "CS", "DA", "DE", "EL", "EN", "ES", "ET", "FI", "FR", 
                        "HU", "ID", "IT", "JA", "LT", "LV", "NL", "PL", "PT", "RO", 
                        "RU", "SK", "SL", "SV", "TR", "ZH")
  
  # had to change it to string so that shiny would work properly
  if(source_language == "NULL") {
    source_language <- NULL
  }
  if(!is.null(source_language)) {
    if((source_language %in% lang_codes_input) == FALSE) {
      stop("Argument 'source_language' must be an available language code. 
           Check help file for more information.")
    }
  }
  
  lang_codes_formal <- c("DE", "FR", "IT", "ES", "NL", "PL", "PT-PT", "PT-BR", "RU")
  if(!formality == "default") {
    if((target_language %in% lang_codes_formal) == FALSE) {
      stop("Argument 'formality' must be an available language code. 
         Check help file for more information")
    }
  }
  
  # Check that other arguments are valid
  formal_arguments <- c("default", "less", "more")
  if((formality %in% formal_arguments) == FALSE) {
    stop("Argument 'formality' must be a valid string. 
         Check help file for more information.") 
  }
  
  # transform formatting argument back to numerical so it can be used by function
  if(preserve_formatting == "0") {
    preserve_formatting <- 0
  } else if(preserve_formatting == "1") {
    preserve_formatting <- 1
  }
  formatting_arguments <- c(0, 1)
  if((preserve_formatting %in% formatting_arguments) == FALSE) {
    stop("Argument 'preserve_formatting' must be a valid number. 
         Check help file for more information.")
  }
  
  # Get API 
  url <- "https://api-free.deepl.com/v2/translate?auth_key=bff36225-b49d-4979-124c-0b52ebbee98d:fx"
  
  # API request
  raw_result <- httr::POST(url, query = list(text = input_text, 
                                             target_lang = target_language, 
                                             source_lang = source_language, 
                                             formality = formality,
                                             preserve_formatting = preserve_formatting))
  
  # Get readable data
  data <- jsonlite::fromJSON(rawToChar(raw_result$content))
  
  # Save outputs
  output_text <- data$translations$text
  source_language <- data$translations$detected_source_language
  
  # Create class
  output <- list('input_text' = input_text, 
                 'source_language' = source_language, 
                 'output_text' = output_text,
                 'target_language' = target_language)
  class(output) <- "translation"
  
  # Print output
  print(output)
}


