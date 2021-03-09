library(tidyverse)
library(rvest)

website <- "https://webscraping-tures.github.io/wahlbeteiligung.html" %>% 
  read_html()

wahlbeteiligung <- tibble(
  Bundesland = website %>%
    html_nodes(css = "span.bundesland-name") %>% 
    html_text(),
  Wahljahr = website %>% 
    html_nodes(css = "span.wahljahr") %>% 
    html_text() %>% 
    as.numeric(),
  Wahlbeteiligung = website %>% 
    html_nodes(css = "span.wahlbeteiligung") %>% 
    html_text() %>% 
    as.numeric()
)

wahlbeteiligung

