
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

#' Translate Sentences
#'
#' @description Translates text into a target language. Original language does 
#' not need to be specified as function automatically recognises it.
#' 
#' @param text String to be translated.
#'
#' @param target_lang Language code of language user wishes to translate sentence to. 
#' Current options are: "BG”  (Bulgarian), "CS" (Czech), "DA" (Danish), "DE" (German), 
#' "EL" (Greek), "EN-GB" (British English), "EN-US" (American English), "ES" (Spanish), 
#' "ET" (Estonian), "FI" (Finnish), "FR" (French), "HU" (Hungarian), "ID" (Indonesian), 
#' "IT" (Italian), "JA" (Japanese), "LT" (Lithuanian), "LV" (Latvian), "NL" (Dutch), 
#' "PL" (Polish), "PT-PT" (Portuguese), "PT-BR" (Brazilian Portuguese), "RO" (Romanian), 
#' "RU" (Russian), "SK" (Slovak), "SL" (Slovenian), "SV" (Swedish), "TR" (Turkish), and
#' "ZH" (Chinese)
#'
#' @return The translated version of \code{text} in target language \code{target_lang}
#'
#' @example translate("Hello world!", "FR")


### Translate Function ###

#' @export
translate <- function(text, target_lang) {
  
  ## Check that both arguments are strings ##
  if(!assertthat::is.string(text))
    stop("Argument 'text' must be a string.")
  
  if(!assertthat::is.string(target_lang))
     stop("Argument 'target_lang' must be a string.")
  
  
  ## Check that argument 2 is from language codes list ##
  lang_codes <- c("BG", "CS", "DA", "DE", "EL", "EN-GB", "EN-US", "ES", "ET", 
                  "FI", "FR", "HU", "ID", "IT", "JA", "LT", "LV", "NL", "PL", 
                  "PT-PT", "PT-BR", "RO", "RU", "SK", "SL", "SV", "TR", "ZH")
  
  if((target_lang %in% lang_codes) == FALSE)
    stop("Argument 'target_lang' must be an available language code.")
  
  
  ## Temporary function output ##
  print(text)

  # Get API
  #url <- "https://api-free.deepl.com/v2/translate?auth_key=bff36225-b49d-4979-124c-0b52ebbee98d:fx"
  #raw_result <- httr::GET(url)

  # Convert it to usable format
  #content <- httr::content(raw_result, as = "text")
  #content_json <- jsonlite::fromJSON(content)
}

### Create Database with Translations ###


