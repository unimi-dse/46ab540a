#' Reviews Scraping
#'
#' Scrape product's reviews from a single review page
#'
#' @param product_code A string indicates a unique code of product (aka ASIN) from Amazon
#' @param page_num numeric number indicates a certain page's numer
#'
#' @return a list of reviews from indicated page
#'
#' @examples  scrape_reviews('B004I8VJ1Y',10)
#'
#' @export

scrape_reviews <- function(product_code,page_num){
  url <- paste0("https://www.amazon.co.uk/product-reviews/",product_code,"/?pageNumber=",page_num)
  reviews_text <- xml2::read_html(url) %>%
    rvest::html_nodes("[class='a-size-base review-text review-text-content']") %>%
    rvest::html_text()
  return(reviews_text)
}



