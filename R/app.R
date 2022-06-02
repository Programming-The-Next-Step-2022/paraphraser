### TO DO ### ------------------------------------------------------------------

# DONE - make formatting button work
# DONE - make sure formatting button only appears if available target language is selected
# DONEish (always showing) - show detected source language somewhere 
# DONE - make sure detect language in source language works

# Creating help file -----------------------------------------------------------
#' Translator Shiny App
#' 
#' @description This function takes no arguments and only launches a shiny app from
#' user's R Studio. Check `?translate()` to know more about how the main translate 
#' function works.
#' 
#' @return Launches shiny app user interface where you can use the translate function 
#' in a more user friendly way.
#' 
#' @examples 
#' shiny_translate()


# Define UI --------------------------------------------------------------------
#' @export
shiny_translate <- function() {
  require("shiny")
  
  ui <- fluidPage(
    theme = shinythemes::shinytheme("sandstone"),
    tags$head(tags$style(HTML('* {font-family: "Beirut"};'))),
    
    titlePanel(h1("Translator", align = "center")),
    p("This translator was built with an R package that uses the API from Deepl. 
      (https://www.deepl.com). You can choose from 28 different languages to 
      translate your text to. Input your text in the left box and select which 
      language you want to translate it to in the drop down button on the right.",
      align = "center"),
    
    fluidRow(
      # Left Section: 
      column(4,
             align = "center",
             
             # Select source language
             selectInput("source", 
                         label="", 
                         choices = c("Detect Language" = "NULL", 
                                     "Bulgarian" = "BG", "Czech" = "CS",
                                     "Danish" = "DA", "German" = "DE",
                                     "Greek" = "EL", "English" = "EN",
                                     "Spanish" = "ES", "Estonian" = "ET", 
                                     "Finnish" = "FI", "French" = "FR", 
                                     "Hungarian" = "HU", "Indonesian" = "ID",
                                     "Italian" = "IT", "Japanese" = "JA", 
                                     "Lithuanian" = "LT", "Latvian" = "LV",
                                     "Dutch" = "NL", "Polish" = "PL", 
                                     "Portuguese" = "PT", "Romanian" = "RO", 
                                     "Russian" = "RU", "Slovak" = "SK", 
                                     "Slovenian" = "SL", "Swedish" = "SV", 
                                     "Turkish" = "TR", "Chinese" = "ZH"),
                         selected = "NULL"),
             
             # Text input
             wellPanel(
               div(style = "height=800px",
                           textOutput("detected_source"),
                           textAreaInput("input_text",
                                         label="", 
                                         value ="", 
                                         height = "450px"))
               )
      ),
      
      # Middle section:
      column(width = 4,
             align="center",
             
             # Formatting button
             wellPanel(
               radioButtons("formatting",
                            label= "Choose whether you want to keep original formatting:",
                            choices = c("Yes" = "1", "No" = "0"),
                            selected = "1"),
               
               # Conditions to make formality button appear or not
               conditionalPanel(
                 condition = "input.target == 'PT-PT'",
                 radioButtons("formality", 
                              label ="Choose the level of formality:", 
                              choices = c("Default"="default", 
                                          "Formal"="more", 
                                          "Informal"="less"),
                              selected = "default"),
                 ),
               conditionalPanel(
                 condition = "input.target == 'RU'",
                 radioButtons("formality", 
                              label ="Choose the level of formality:", 
                              choices = c("Default"="default",
                                          "Formal"="more", 
                                          "Informal"="less"),
                              selected = "default")
                 ),
               conditionalPanel(
                 condition = "input.target == 'PT-BR'",
                 radioButtons("formality", 
                              label ="Choose the level of formality:", 
                              choices = c("Default"="default", 
                                          "Formal"="more", 
                                          "Informal"="less"),
                              selected = "default")
                 ),
               conditionalPanel(
                 condition = "input.target == 'DE'",
                 radioButtons("formality", 
                              label ="Choose the level of formality:", 
                              choices = c("Default"="default", 
                                          "Formal"="more", 
                                          "Informal"="less"),
                              selected = "default")
                 ),
               conditionalPanel(
                 condition = "input.target == 'FR'",
                 radioButtons("formality", 
                              label ="Choose the level of formality:", 
                              choices = c("Default"="default", 
                                          "Formal"="more", 
                                          "Informal"="less"),
                              selected = "default")
                 ),
               conditionalPanel(
                 condition = "input.target == 'IT'",
                 radioButtons("formality",
                              label ="Choose the level of formality:", 
                              choices = c("Default"="default",
                                          "Formal"="more", 
                                          "Informal"="less"),
                              selected = "default")
                 ),
               conditionalPanel(
                 condition = "input.target == 'ES'",
                 radioButtons("formality",
                              label ="Choose the level of formality:", 
                              choices = c("Default"="default", 
                                          "Formal"="more", 
                                          "Informal"="less"),
                              selected = "default")
                 ),
               conditionalPanel(
                 condition = "input.target == 'NL'",
                 radioButtons("formality",
                              label ="Choose the level of formality:", 
                              choices = c("Default"="default",
                                          "Formal"="more", 
                                          "Informal"="less"),
                              selected = "default")
                 ),
               conditionalPanel(
                 condition = "input.target == 'PL'",
                 radioButtons("formality", 
                              label ="Choose the level of formality:",
                              choices = c("Default"="default",
                                          "Formal"="more", 
                                          "Informal"="less"),
                              selected = "default")
                 )
               )
             ),
      
      # Right Section: 
      column(width = 4,
             align = "center",
             
             # Select target language
             selectInput("target",
                           label="", 
                           choices = c("Bulgarian" = "BG", "Czech" = "CS", 
                                       "Danish" = "DA", "German" = "DE",
                                       "Greek" = "EL", "British English" = "EN-GB",
                                       "American English" = "EN-US", 
                                       "Spanish" = "ES", "Estonian" = "ET", 
                                       "Finnish" = "FI", "French" = "FR", 
                                       "Hungarian" = "HU", "Indonesian" = "ID", 
                                       "Italian" = "IT", "Japanese" = "JA", 
                                       "Lithuanian" = "LT", "Latvian" = "LV",
                                       "Dutch" = "NL", "Polish" = "PL", 
                                       "Portuguese" = "PT-PT",
                                       "Brazilian Portuguese" = "PT-BR",
                                       "Romanian" = "RO", "Russian" = "RU",
                                       "Slovak" = "SK", "Slovenian" = "SL",
                                       "Swedish" = "SV", "Turkish" = "TR",
                                       "Chinese" = "ZH")),
             
             # Output translated text 
             wellPanel(
               div(style = "height:500px", textOutput("text_output"))
               )
             )
      )
    ) 
  
  
  # Define server --------------------------------------------------------------
  server <- function(input, output) {
    
    # Output translated text
    output$text_output <- renderText({
      translation <- translate(input_text = input$input_text, 
                               target_language = input$target,
                               source_language = input$source,
                               formality = input$formality,
                               preserve_formatting = input$formatting)
      translation$output_text
    })
    
    # Output detected language
    output$detected_source <- renderText({
      # Create code to language mapping
      code_to_lang <- c("BG" = "Bulgarian", "CS" = "Czech","DA" = "Danish", 
                        "DE" = "German","EL" = "Greek", "EN" = "English", 
                        "ES" = "Spanish", "ET" = "Estonian", "FI" = "Finnish", 
                        "FR" = "French", "HU" = "Hungarian", "ID" = "Indonesian", 
                        "IT" = "Italian", "JA" = "Japanese", "LT" = "Lithuanian", 
                        "LV" = "Latvian", "NL" = "Dutch", "PL" = "Polish", 
                        "PT" = "Portuguese", "RO" = "Romanian", "RU" = "Russian", 
                        "SK" = "Slovak", "SL" = "Slovenian", "SV" = "Swedish", 
                        "TR" = "Turkish", "ZH" = "Chinese")
      
      # Re run translation to be able to access source_language
      translation <- translate(input_text = input$input_text, 
                                 target_language = input$target,
                                 source_language = input$source,
                                 formality = input$formality,
                                 preserve_formatting = input$formatting)
      source_code <- translation$source_language
      source_lang <- code_to_lang[source_code]
      paste("Detected language is: ", source_lang)
    })
  }
  
  # Create shiny app -----------------------------------------------------------
  shinyApp(ui = ui, server = server)
}
