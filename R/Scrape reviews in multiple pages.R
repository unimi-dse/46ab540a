multiple_scrape <- function(product_code, page_range){
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
    scrape_reviews(product_code = product_code, page_num = j) # Scrape
  }) -> output_list
  return(output_list)
}

#multiple_scrape('B004I8VJ1Y',1:4)   # Indicate product you want to check, Scrape pages 1 to 4
