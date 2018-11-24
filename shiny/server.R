library(shiny)
library(dygraphs)
library(readr)
library(xts)
Sys.setenv(TZ = "Australia/Sydney")


res <- read_csv("https://github.com/ellisp/speedtest/raw/master/test-results.csv",
                locale = locale(tz = "Australia/Sydney"))
dl <- xts(res$download / 1000000, as.POSIXct(res$timestamp), tzone = "Australia/Sydney")


shinyServer(function(input, output, session) {
   output$download <- renderDygraph({
     dygraph(dl, main = "Download rates") %>%
       dyAxis("y", label = "Megabits per second\n") %>%
       dyRangeSelector()
   })

})
