library(shiny)

## Define the user interface ##
ui <- fluidPage(
  
  ## Application title ##
  titlePanel("Switchgrass Predictive Yield Model"),
  
  ## Sidebar layout with input and output definitions ##
  sidebarLayout(
    
    ## Sidebar panel for inputs ##
    sidebarPanel(
      
      ## Input: Precipitation ##
      sliderInput(inputId = "precip",
                  label = "Growing Season Precipitation (mm)",
                  value = 25, min = 1, max = 2000),
      
      ## Input: Growing  Degree Days ##
      sliderInput(inputId = "gdd",
                  label = "Growing Season Growing Degree Days (GDD)",
                  value = 1000, min = 500, max = 5000),
      
      ## Input: actionButton() to defer the rendering of output 
      ## until the user explicitly clicks the button (rather than doing it
      ## immediately when inputs change). ##
      actionButton(inputId = "calc",
                   label = "Calculate Yield")
      ),
    
    ## Main panel for displaying outputs ##
    mainPanel(
      
      ## Output: Header + summary of distribution ##
      h4("Predicted Yield"),
      verbatimTextOutput("yield"),
    
      ## Output: Yield value ##
      plotOutput("yield2")
      
      )
  )
  
)
  

## Define server logic ##
server <- function(input, output) {
  output$yield2 <- renderText({
    
  })
 
}


## Run the application ##
shinyApp(ui = ui, server = server)