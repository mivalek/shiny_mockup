#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that records local time on button click
ui <- fluidPage(
    # This adds the javascript file to <head> of the shiny app html file
    # The file itself is in the /www folder
    tags$head(tags$script(src = "record_time.js")),
    # tags$footer(tags$script(src = "record_time.js")),
    # Application title
    titlePanel("Record time minimal example"),
    # add button
    actionButton("start", "start"),
    # this is just for demo purposes to print out the time
    textOutput("time_display")
)

# Define server logic required to record and display time
server <- function(input, output, session) {
    # R part of what the button does
    # in this case, it prints the content of the
    # input$startTime variable (created using javascript)
    # into the textOutput field
    observeEvent(input$start, {
      output$time_display <- renderText({ 
        input$startTime
      })
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
