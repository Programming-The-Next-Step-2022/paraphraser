
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'


library("shiny")

#define UI
ui <- fluidPage(

)

#define server
server <- function(input, output) {

}

#create shiny app
shinyApp(ui = ui, server = server)

