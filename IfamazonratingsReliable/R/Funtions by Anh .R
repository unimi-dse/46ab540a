install.packages('rvest')
install.packages('tidytext')
install.packages('tidyverse')
require(rvest)
library(tidyverse) #keeping things tidy
library(tidytext) #package for tidy text analysis
library(glue)  #for pasting strings
library(stringr)
library(gsubfn)
##################################
#########################
scrape_reviews <- function(product_code,page_num){
  url <- paste0("https://www.amazon.co.uk/product-reviews/",product_code,"/?pageNumber=",page_num)
  reviews_text <- read_html(url) %>%
    html_nodes("[class='a-size-base review-text review-text-content']") %>%
    html_text()
  return(reviews_text)                     # extract text
}

#scrape_reviews('B004I8VJ1Y',10) scrape reviews of product B004I8VJ1Y in page 10

###################
###################
multiple_scrape <- function(product_code, page_range){
  match_key <- tibble(n = page_range,
                      key = sample(page_range,length(page_range)))# Create a table that scrambles page numbers using `sample()` & For randomising page reads!
  lapply(page_range, function(i){
    j <- match_key[match_key$n==i,]$key

    message("Getting page ",i, " of ",length(page_range), "; Actual: page ",j) # Progressing message

    Sys.sleep(2) # Take a two-seconds break

    if((i %% 4) == 0){ # After every four scrapes... take another one second break

      message(".....be patient pls ^.^")
      Sys.sleep(1) # Take an additional two second break
    }
    scrape_reviews(product_code = product_code, page_num = j) # Scrape
  }) -> output_list
  return(output_list)
}

# multiple_scrape('B004I8VJ1Y',1:4)   # Indicate product you want to check, Scrape pages 1 to 4


################################
##### FUnction to get sentiments

GetSentiment <- function(product_code,page_range){
  reviews_list <- multiple_scrape(product_code,page_range)
  output_text <- paste( unlist(reviews_list), collapse='') #make the list become a tring
  clean_text <- gsubfn(".", list("\n" = "", "!" = "","  "=" "), output_text)
  tokens <- tibble(text = clean_text) %>% unnest_tokens(word, text)
  sentiment <- tokens %>% inner_join(get_sentiments("bing")) %>%
    count(sentiment) %>%
    spread(sentiment, n, fill = 0) %>%
    mutate(sentiment = positive - negative) #need to consider the formula again!
  a <- sentiment [[3]]
  if (a>0){message("This product recieved good reviews")} else {message("BE CAREFUL! This product recieved BAD reviews")}
  return(sentiment)
}

# GetSentiment('B004I8VJ1Y',1:4)

###### DATA VISUALTION
install.packages('ggplot2')
library(ggplot2)





