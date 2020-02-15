#' Sentimental Words Analysing
#'
#' If the number of negative words from reviews is greater than 40 percent of total sentimental words then that product is considered as 'got BAD reviews'and vice versa
#'
#' @param url A string indicates URL of product
#' @param page_range Numeric number indicates a certain page's numer
#'
#' @return Number of negative words, positive word and general sentiment
#'
#' @examples GetSentiment('https://www.amazon.co.uk/find-PHRL3236-Mens-Jumpers-Off-White/dp/B004I8VJ1Y?pf_rd_p=190f0313-4dcb-4239-b2ce-39f9d6bd3b5c&pd_rd_wg=NzF31&pf_rd_r=WJ0HCRPD99CTHV8XN0K0&ref_=pd_gw_unk&pd_rd_w=yoPcr&pd_rd_r=2a39592b-aee9-47b5-a65e-862257e0f4df&th=1',1:2)
#' @export

GetSentiment <- function(url,page_range){
  reviews_list <- multiple_scrape(url,page_range)
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

