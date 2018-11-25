library(shiny)
library(dygraphs)

shinyUI(fluidPage(
  
  titlePanel("Internet speed in Fitzroy, Melbourne"),
  tabsetPanel(
    tabPanel("Download speed", dygraphOutput("download")),
    tabPanel("Upload speed", dygraphOutput("upload")),
    tabPanel("Latency time", dygraphOutput("ping")),
    tabPanel("Correlations", plotOutput("pairs", height = "600px"))
    
  ) 
  

))
