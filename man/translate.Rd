% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/main.R
\name{translate}
\alias{translate}
\title{Translate}
\usage{
translate(
  input_text,
  target_language,
  source_language = "NULL",
  formality = "default",
  preserve_formatting = "1"
)
}
\arguments{
\item{input_text}{String(s) to be translated.}

\item{target_language}{Language code of language user wishes to translate
sentence to. Current target language options are: "BG”  (Bulgarian), "CS"
(Czech), "DA" (Danish), "DE" (German), "EL" (Greek), "EN-GB" (British English),
"EN-US" (American English), "ES" (Spanish), "ET" (Estonian), "FI" (Finnish),
"FR" (French), "HU" (Hungarian), "ID" (Indonesian), "IT" (Italian), "JA"
(Japanese), "LT" (Lithuanian), "LV" (Latvian), "NL" (Dutch), "PL" (Polish),
"PT-PT" (Portuguese), "PT-BR" (Brazilian Portuguese), "RO" (Romanian), "RU"
(Russian), "SK" (Slovak), "SL" (Slovenian), "SV" (Swedish), "TR" (Turkish),
and "ZH" (Chinese).}

\item{source_language}{Optional argument to set the language of the
\code{input_text}. If not specified, function will attempt to automatically
recognise language. Current target language options are: "BG”  (Bulgarian),
"CS" (Czech), "DA" (Danish), "DE" (German), "EL" (Greek), "EN" (all English
varieties), "ES" (Spanish), "ET" (Estonian), "FI" (Finnish), "FR" (French),
"HU" (Hungarian), "ID" (Indonesian), "IT" (Italian), "JA" (Japanese), "LT"
(Lithuanian), "LV" (Latvian), "NL" (Dutch), "PL" (Polish), "PT" (all
Portuguese varieties), "RO" (Romanian), "RU" (Russian), "SK" (Slovak), "SL"
(Slovenian), "SV" (Swedish), "TR" (Turkish), and "ZH" (Chinese).}

\item{formality}{Optional argument to determine whether the translation should
be more formal or informal. The possible options are "default" (default),
"more" for a more formal language, and "less" for a more informal language.
This currently only works for the following languages: "DE" (German), "FR"
(French), "IT" (Italian), "ES" (Spanish), "NL" (Dutch), "PL" (Polish), "PT-PT",
"PT-BR" (Portuguese), and "RU" (Russian).}

\item{preserve_formatting}{Optional argument to determine whether the translator
should respect the original formatting of the \code{input_text}. Possible
aspects affected by this formatting include punctuation and upper or lower
cases at the start and end of sentences. Possible options are 1 (default) for
preserving formatting of \code{input_text}, or 0 for possibly changing the formatting.}
}
\value{
Returns a list of 4 objects and the class attribute of this list:
\code{input_text} which is the text the user has given as the first arguement;
\code{source_language} which is specified by the user or automatically detected;
\code{output_text} which is the translated version of input text;
and \code{target_language} which is the language of the translated text, which the
user has given as the second argument to the function.
}
\description{
Translates text into a target language. Uses Deepl API
(https://www.deepl.com/) to provide high quality translations.
}
\examples{
translate("Hello world!", "FR", "EN")

translate("The brown fox jumped over the black cat.", "PT-PT", 
           formality = "more")

translate("i forgot about it. no i have to go back", "RU", "EN", 
           formality = "less", split_sentences = 0, preserve_formatting = 1)
}
