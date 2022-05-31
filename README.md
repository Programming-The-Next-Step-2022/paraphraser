# Translator #

### What it does ###
This package was built in the context of research into eHealth interventions, particularly for ones that use messages that are sent to users to incentivise them to engage in healthier behaviours. These are often large projects where collaboration between different research labs, universities, and countries is crucial. Therefore, it is important to be able to easily translate these messages that are created into various languages and store them in a format that is easy to work with.\
However, the package can be useful to any situation that requires nuanced translations.

### How it works ###
This package uses Deepl (https://www.deepl.com/translator) API to translate text into various languages. Deepl uses neural machine translation to provide very accurate translations into various languages. 

### User interface ###
The user interface was created with Shiny from R Studio (<https://shiny.rstudio.com/>).
![User Interface](/Users/margaridamoreirasilva/Documents/GitHub/translate_/screenshots/example2.png) 

### How it was built ###
This package was built with RStudio with a R Shinny App user interface.

### Examples ###

```
# 1. Using only the essential arguments
# Translating text to Russian:
translate(input_text = "Hello world!", 
          target_language = "RU")


# 2. Using optional arguments as well
# Translating text to Brazilian Portuguese:
translate(input_text = "A wonderful serenity has taken possession of my entire soul", 
          target_language = "PT-BR",
          source_language = "EN",
          formality = "less",
          preserve_formatting = 1)

```
