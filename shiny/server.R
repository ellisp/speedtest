library(shiny)
library(dygraphs)
library(readr)
library(xts)
library(GGally)

Sys.setenv(TZ = "Australia/Sydney")


res <- read_csv("https://github.com/ellisp/speedtest/raw/master/test-results.csv",
                locale = locale(tz = "Australia/Sydney"))
res$download <- res$download / 1000000
res$upload <- res$upload / 1000000

dl <- xts(res$download, as.POSIXct(res$timestamp), tzone = "Australia/Sydney")
ul <- xts(res$upload, as.POSIXct(res$timestamp), tzone = "Australia/Sydney")
ping <- xts(res$ping, as.POSIXct(res$timestamp), tzone = "Australia/Sydney")

#' Function for drawing a path plot
csp <- function(data, mapping, ...){
  p <- ggplot(data = data, mapping = mapping) +
    geom_path(colour = "grey50") +
    geom_point(colour = "steelblue")
    
  return(p)
}

shinyServer(function(input, output, session) {
   output$download <- renderDygraph({
     dygraph(dl, main = "Download rates") %>%
       dyAxis("y", label = "Megabits per second\n") %>%
       dyRangeSelector()
   })
   
   output$upload <- renderDygraph({
     dygraph(ul, main = "Upload rates") %>%
       dyAxis("y", label = "Megabits per second\n") %>%
       dyRangeSelector()
   })
   
   output$ping <- renderDygraph({
     dygraph(ping, main = "Latency time") %>%
       dyAxis("y", label = "Milliseconds\n") %>%
       dyRangeSelector()
   })
   
   output$pairs <- renderPlot({
     res[ , 1:3] %>%
       ggpairs(lower = list(continuous = csp)) +
       theme_bw() +
       theme(strip.background = element_rect(colour = "grey85"))
     })

})
