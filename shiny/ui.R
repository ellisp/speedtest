library(shiny)
library(dygraphs)

shinyUI(fluidPage(
  
  titlePanel("Internet speed in Fitzroy, Melbourne"),
   dygraphOutput("download")

))
