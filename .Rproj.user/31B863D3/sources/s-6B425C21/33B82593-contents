# Translator #

### What it does ###
This package was built in the context of research into eHealth interventions, particularly for ones that use messages that are sent to users to incentivise them to engage in healthier behaviours. These are often large projects where collaboration between different research labs, universities, and countries is crucial. Therefore, it is important to be able to easily translate these messages that are created into various languages and store them in a format that is easy to work with.\
However, the package can be useful to any situation that requires nuanced translations.

### How it works ###
This package uses Deepl (https://www.deepl.com/translator) API to translate text into various languages. Deepl uses neural machine translation to provide very accurate translations into various languages. The package has two functions to help users translate text.

### Functions ###

* `translate()` which takes text and outputs it translated into a target language specified by the user. It takes two necessary inputs to do this: `input_text` and `target_language`. Optional arguments include the `source_language`, which if not specified will be detected by the translator, `formality` which is available for some languages, making the translation more or less formal, and `preserve_formatting` to determine whether the translator should preserve the formatting of the input text or change it if needed. This function outputs a list with the `input_text`, `source_language`, `target_language`, and the translated `output_text`.

* `shiny_translate()` takes no inputs. Calling this function will launch the shiny app created as a user interface for the `translate()` function. 

### User interface ###
The user interface was created with Shiny from R Studio (<https://shiny.rstudio.com/>).


### Examples ###

```{r}

### Translate 
# Using only the essential arguments
# Translating text to Russian:
translation_example <- translate(input_text = "Hello world!", 
          target_language = "RU")
translation_example$output_text

# Using optional arguments as well
# Translating text to Brazilian Portuguese:
translate(input_text = "A wonderful serenity has taken possession of my entire soul", 
          target_language = "PT-BR",
          source_language = "EN",
          formality = "less",
          preserve_formatting = 1)
          
          
### Shiny Translate
shiny_translate()

```

### How it was built ###
This package was built with R Studio and R Shinny.
