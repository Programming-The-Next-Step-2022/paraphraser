library("shiny")
library("shinythemes")

# would this work if its not loaded in my computer? - maybe needs to be changed
source("~/Documents/GitHub/translate_/R/main.R")

### TO DO ### ------------------------

# make output text box always visible and fixed size to match input text box
# improve general appearance
# make split_sentences and formatting buttons work
# make sure formatting button only appears if available target language is selected
# show detected source language somewhere - maybe update source button? 


# Define UI ------------------------------------------------------------------
ui <- fluidPage(
  theme= shinytheme("sandstone"),
  
  tags$head(tags$style(HTML('* {font-family: "Beirut"};'))),
  
  titlePanel("Translator"),
  
  p("This translator was built with an R package that uses the API from Deepl. 
    (https://www.deepl.com). You can choose from 28 different languages and input
    your text in the left box."),
  
  fluidRow(
    column(12,
           "",
           
           fluidRow(
             
             column(4,
                    "",
                    wellPanel( 
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
                                  selected = "EN"),
                      textAreaInput("input_text", label="", value ="", height = "500px")
                    )
                    ),
             
             # buttons are only working after text?
             column(width = 3, 
                    "",
                    wellPanel(
                      # make sure this button only shows up for the available target languages
                      radioButtons("formality", 
                                   label ="Choose the level of formality:", 
                                   choices = c("Default"="default", "Formal"="more", "Informal"="less")),
                      
                      radioButtons("formatting",
                                   label= "Choose whether you want to keep original formatting:",
                                   choices = c("Yes" = 1, "No" = 0),
                                   selected = 1),
                      
                      radioButtons("split_sentences",
                                   label = "Choose whether you want the sentences to be split:",
                                   choices = c("Yes" = 1, "No" = 0))
                    )
                    ),
            
             column(width = 4,
                    "",
                    wellPanel(  
                      selectInput("target", label="", 
                                  choices = c("Bulgarian" = "BG", "Czech" = "CS", 
                                              "Danish" = "DA", "German" = "DE",
                                              "Greek" = "EL", "British English" = "EN-GB",
                                              "American English" = "EN-US", "Spanish" = "ES",
                                              "Estonian" = "ET", "Finnish" = "FI", 
                                              "French" = "FR", "Hungarian" = "HU",
                                              "Indonesian" = "ID", "Italian" = "IT",
                                              "Japanese" = "JA", "Lithuanian" = "LT",
                                              "Latvian" = "LV", "Dutch" = "NL",
                                              "Polish" = "PL", "Portuguese" = "PT-PT",
                                              "Brazilian Portuguese" = "PT-BR",
                                              "Romanian" = "RO", "Russian" = "RU",
                                              "Slovak" = "SK", "Slovenian" = "SL",
                                              "Swedish" = "SV", "Turkish" = "TR",
                                              "Chinese" = "ZH")),
                      textOutput("text_output")
                    )
                    )
           )
    )
  )
)#close ui


# Define server -------------------------------------------------------------
server <- function(input, output) {
  output$text_output <- renderText({
    translation <- translate(input_text = input$input_text, 
                             target_language = input$target,
                             source_language = input$source,
                             formality = input$formality
                             #preserve_formatting = input$formatting
                             )
    translation$output_text
  })
  
  
}

# Create shiny app -----------------------------------------------------------
shinyApp(ui = ui, server = server)

