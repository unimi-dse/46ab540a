#' Sentimental Words Plotting
#'
#' Plotting a column graph, shows words whose highest frequencies
#'
#' @param product_code A string indicates a unique code of product (aka ASIN) from Amazon
#' @param page_range a rage of number indicating starting page and ending page to extract reviews
#'
#' @return Null
#'
#' @examples plotbing('B004I8VJ1Y',1:4)
#'
#' @export
plotbing <- function (product_code,page_range) {
  output_list <- multiple_scrape(product_code,page_range)
  output_text <- paste( unlist(output_list), collapse='')
  bing_counts <- dplyr::tibble(text = output_text) %>% tidytext::unnest_tokens(word, text) %>%
    dplyr::inner_join(tidytext::get_sentiments("bing")) %>%
    dplyr::count(word, sentiment, sort = TRUE) %>%
    dplyr::ungroup()
  bing_counts %>%
    dplyr::group_by(sentiment) %>%
    dplyr::top_n(8) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(word = reorder(word, n)) %>%
    ggplot2::ggplot(ggplot2::aes(word, n, fill = sentiment)) +
    ggplot2::geom_col(show.legend = FALSE) +
    ggplot2::facet_wrap(~sentiment, scales = "free_y") +
    ggplot2::labs(y = "Contribution to sentiment",x = NULL) +
    ggplot2::coord_flip()
}


