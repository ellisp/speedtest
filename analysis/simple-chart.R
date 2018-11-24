library(tidyverse)
library(scales)

speeds <- read_csv("test-results.csv")

speeds %>%
  gather(variable, value, -timestamp) %>%
  ggplot(aes(x = timestamp, y = value)) +
  facet_wrap(~variable, scale = "free_y", ncol = 1) +
  geom_point() +
  geom_line() +
  scale_y_continuous(label = comma)
