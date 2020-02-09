#' Sentimental words analysing
#'
#' If the number of negative words is greater than 40%
#'of total sentimental words then showing message 'got BAD reviews'  and vice sera.
#'
#' @param product_code A string indicates unique code of product (aka ASIN) from Amazon
#' @param page_range numeric number indicates a certain page's numer
#'
#' @return Number of negative words, positive word and general sentiment
#'
#' @example GetSentiment('B004I8VJ1Y',1:2)
#'
#' @export

GetSentiment <- function(product_code,page_range){
  reviews_list <- multiple_scrape(product_code,page_range)
  output_text <- paste( unlist(reviews_list), collapse='')
  clean_text <- gsubfn::gsubfn(".", list("\n" = "", "!" = "","  "=" "), output_text)
  tokens <- dplyr::tibble(text = clean_text) %>% tidytext::unnest_tokens(word, text)
  sentiment <- tokens %>% dplyr::inner_join(tidytext::get_sentiments("bing")) %>%
    dplyr::count(sentiment) %>%
    tidyr::spread(sentiment, n, fill = 0) %>%
    dplyr::mutate(sentiment = 3*negative-2*positive)
  a <- sentiment [[3]]
  if (a<0){message("This product recieved good reviews")} else {message("BE CAREFUL! This product recieved more than 40% BAD reviews")}
  return(sentiment)
}


