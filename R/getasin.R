#'@title Get ASIN
#'
#'@description Get Amazon product's code from URL
#'
#' @param product_code A string indicates a unique code of product (aka ASIN) from Amazon
#' @param page_range numeric number indicates a certain page's numer
#'
#' @return Number of negative words, positive word and general sentiment
#'
#' @examples getasin('https://www.amazon.co.uk/New-Wave-Swimming-Swimmers-Triathletes/dp/B07BJYBWV3/ref=pd_rhf_gw_s_pd_crcd_0_2/262-2608160-1236902?_encoding=UTF8&pd_rd_i=B07BJYBWV3&pd_rd_r=f248135a-ae56-4012-a8c9-c34ecb6b22d9&pd_rd_w=gaN0r&pd_rd_wg=5FrkD&pf_rd_p=616a8cf7-bb88-4c15-bbd1-1854046edbed&pf_rd_r=BQ5PHCY3W0WRMA8C4S5N&psc=1&refRID=BQ5PHCY3W0WRMA8C4S5N')
#'
#' @export

getasin <- function(url){
  tail_url <- strsplit(url, "/")[[1]][6]
  asin <- substring(tail_url,1,10)
  return(asin)
}
