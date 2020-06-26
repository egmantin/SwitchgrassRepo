library(markdown)
library(shiny)
library(agricolae)
library(lme4)
library(nlme)
library(boot)
library(ggplot2)


## Read in data from Excel ##
sg <- read.table("2020-05-13_SG_Model Data.csv", header = TRUE, sep = ",")

## Standardization of data ##
meanYield <- mean(sg$Yield)
sdYield <- sd(sg$Yield)
zYield <- (sg$Yield - meanYield) / sdYield

meanPrecip <- mean(sg$Precipitation)
sdPrecip <- sd(sg$Precipitation)
zPrecip <- (sg$Precipitation - meanPrecip) / sdPrecip

meanGDD <- mean(sg$GDD)
sdGDD <- sd(sg$GDD)
zGDD <- (sg$GDD - meanGDD) / sdGDD

## Define the user interface ##
ui <- navbarPage("Predictive Yield Models",
                 
                 tabPanel("About",
                          fluidRow(
                            column(6,
                                   includeHTML("about.html")
                          )
                 )
                 ),
                 
                 tabPanel("Switchgrass",
                          sidebarLayout(
                            sidebarPanel(
                              sliderInput(inputId = "precip",
                                          label = "Growing Season Precipitation (mm)",
                                          value = 50, min = 1, max = 2000),
                              sliderInput(inputId = "gdd",
                                          label = "Growing Degree Days (GDD)",
                                          value = 1000, min = 500, max = 5000)
                            ),
                            mainPanel(
                              h2("Predicted Yield (Mg/ha)",
                                      verbatimTextOutput("yield"),
                                      
                                      h3(textOutput("yield2"))
                              
                            )
                          )
                 )
)
)

  
server <- function(input, output, session) {
    output$yield2 <- renderText({
    
    ## Calculate zprecip value ##
    
    precip_z <- (input$precip - meanPrecip) / sdPrecip
    
    ## Calculate zGDD value ##
    
    GDD_z <- (input$gdd - meanGDD) / sdGDD
    
    ## Calculate zYield value ##
    
    zYield <- ((0.09657*precip_z)+(0.0101*precip_z^2)+(0.01519*GDD_z)-0.07127)
    
    ## Calculate predicted yield ##
    
    conYield <- ((zYield*sdYield)+meanYield)
    
    print(conYield)
  })
  
}

shinyApp(ui, server)