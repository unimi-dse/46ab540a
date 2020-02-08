GetSentiment <- function(product_code,page_range){
  reviews_list <- multiple_scrape(product_code,page_range)
  output_text <- paste( unlist(reviews_list), collapse='') #make the list become a tring
  clean_text <- gsubfn::gsubfn(".", list("\n" = "", "!" = "","  "=" "), output_text)
  tokens <- dplyr::tibble(text = clean_text) %>% tidytext::unnest_tokens(word, text)
  sentiment <- tokens %>% dplyr::inner_join(tidytext::get_sentiments("bing")) %>%
    dplyr::count(sentiment) %>%
    tidyr::spread(sentiment, n, fill = 0) %>%
    dplyr::mutate(sentiment = 3*negative-2*positive) #check if x/(x+y)]>40%
  a <- sentiment [[3]]
  if (a<0){message("This product recieved good reviews")} else {message("BE CAREFUL! This product recieved BAD reviews")}
  return(sentiment) #if number of negative words is greater than 40% of total sentimental words then that product is considered as 'got BAD reviews'.
}

#GetSentiment('B004I8VJ1Y',1:2)
