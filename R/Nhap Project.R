install.packages('rvest')
install.packages('tidytext')
install.packages('tidyverse')
require(rvest)
require(tidyverse)
library(tidyverse) #keeping things tidy
library(tidytext) #package for tidy text analysis
library(glue)  #for pasting strings
library(stringr)

scrape_reviews <- function(ASIN,page_num){
  url <- paste0("https://www.amazon.co.uk/product-reviews/",ASIN,"/?pageNumber=",page_num)
  reviews_text <- read_html(url) %>%
    html_nodes("[class='a-size-base review-text review-text-content']") %>%
    html_text()  
  return(reviews_text)                     # extract text
} 

# Create a table that scrambles page numbers using `sample()` & For randomising page reads!
match_key <- tibble(n = page_range,
                    key = sample(page_range,length(page_range)))

multiple_scrape <- function(ASIN, page_range){
  lapply(page_range, function(i){
    j <- match_key[match_key$n==i,]$key
    
    message("Getting page ",i, " of ",length(page_range), "; Actual: page ",j) # Progress bar
    
    Sys.sleep(2) # Take a two-seconds break
    
    if((i %% 4) == 0){ # After every four scrapes... take another one second break
      
      message(".....be patient pls ^.^") 
      Sys.sleep(1) # Take an additional two second break
    }
    scrape_reviews(ASIN = ASIN, page_num = j) # Scrape
  })
 
} -> output_list # taji sao bo output_list o day no ko vao gia tri dc

multiple_scrape('B004I8VJ1Y',1:10) -> output_list  # Indicate product you want to check, Scrape pages 1 to 10



##### FUnction to get sentiments
install.packages("gsubfn")
library('gsubfn')

GetSentiment <- function(list){
  output_text <- paste( unlist(output_list), collapse='') #make the list become a tring
  fileText <- trimws(output_text) #xoa di, du roi
  fileText <- gsubfn(".", list("\n" = "", "!" = "","  "=" "), fileText) 
  tokens <- tibble(text = fileText) %>% unnest_tokens(word, text)
  sentiment <- tokens %>% inner_join(get_sentiments("bing")) %>% 
    count(sentiment) %>%
    spread(sentiment, n, fill = 0) %>%
    mutate(sentiment = positive - negative) 
  return(sentiment)
}
GetSentiment(output_list)

GetSentiment()

