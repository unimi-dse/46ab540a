scrape_reviews <- function(product_code,page_num){
  url <- paste0("https://www.amazon.co.uk/product-reviews/",product_code,"/?pageNumber=",page_num)
  reviews_text <- xml2::read_html(url) %>%
    rvest::html_nodes("[class='a-size-base review-text review-text-content']") %>%
    rvest::html_text()
  return(reviews_text)                     # extract text
}

#scrape_reviews('B004I8VJ1Y',10) scrape reviews of product B004I8VJ1Y in page 10
