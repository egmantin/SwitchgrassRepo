library(shiny)

## Define UI for Switchgrass model app ----
ui <- fluidPage(
  
  ## App title ----
  titlePanel("Switchgrass Predictive Yield Model"),
  

    sliderInput(inputId = "precip",
                label = "Growing Season Precipitation (mm)",
                value = 25, min = 1, max = 100),
    
    sliderInput(inputId = "gdd",
                label = "Growing Season Growing Degree Days (GDD)",
                value = 25, min = 1, max = 100),
  plotOutput("hist")
  
)

server <- function(input, output) {
  data <- reactive({
    rnorm(input$precip)
  })
  
  output$hist <- renderPlot({
    hist(data())
  })
  output$hist <- renderPlot({
    hist(data())
  })
}

shinyApp(ui = ui, server = server)