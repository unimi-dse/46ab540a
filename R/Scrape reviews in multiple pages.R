#' Multiple Reviews Scraping
#'
#' Scrape reviews from a single page and loop for other page by randomising orders of pages to avoid being block API
#'
#' @param url URL of product
#' @param page_range a rage of number indicating starting page and ending page to extract reviews
#'
#' @return a list of reviews from multiple pages
#'
#' @examples multiple_scrape('https://www.amazon.co.uk/find-PHRL3236-Mens-Jumpers-Off-White/dp/B004I8VJ1Y?pf_rd_p=190f0313-4dcb-4239-b2ce-39f9d6bd3b5c&pd_rd_wg=NzF31&pf_rd_r=WJ0HCRPD99CTHV8XN0K0&ref_=pd_gw_unk&pd_rd_w=yoPcr&pd_rd_r=2a39592b-aee9-47b5-a65e-862257e0f4df&th=1',1:4)
#'
#' @export


multiple_scrape <- function(url, page_range){
  match_key <- dplyr::tibble(n = page_range,
                      key = sample(page_range,length(page_range)))# Create a table that scrambles page numbers using `sample()` & For randomising page reads!
  lapply(page_range, function(i){
    j <- match_key[match_key$n==i,]$key

    message("Getting page ",i, " of ",length(page_range), "; Actual: page ",j) # Progressing message

    Sys.sleep(1) # Take one second break

    if((i %% 3) == 0){ # After every three scrapes... take another one second break

      message(".....be patient pls ^.^")
      Sys.sleep(1)
    }
    scrape_reviews(url = url, page_num = j) # Scrape
  }) -> output_list
  return(output_list)
}
