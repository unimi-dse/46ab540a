#' Reviews Scraping
#'
#' Scrape product's reviews from a single review page
#'
#' @param url URL of product
#' @param page_num numeric number indicates a certain page's numer
#'
#' @return a list of reviews from indicated page
#'
#' @examples scrape_reviews('https://www.amazon.co.uk/find-PHRL3236-Mens-Jumpers-Off-White/dp/B004I8VJ1Y?pf_rd_p=190f0313-4dcb-4239-b2ce-39f9d6bd3b5c&pd_rd_wg=NzF31&pf_rd_r=WJ0HCRPD99CTHV8XN0K0&ref_=pd_gw_unk&pd_rd_w=yoPcr&pd_rd_r=2a39592b-aee9-47b5-a65e-862257e0f4df&th=1',10)
#'
#' @export

scrape_reviews <- function(url,page_num){
  asin <- getasin(url)
  url <- paste0("https://www.amazon.co.uk/product-reviews/",asin,"/?pageNumber=",page_num)
  reviews_text <- xml2::read_html(url) %>%
    rvest::html_nodes("[class='a-size-base review-text review-text-content']") %>%
    rvest::html_text()
  return(reviews_text)
}



