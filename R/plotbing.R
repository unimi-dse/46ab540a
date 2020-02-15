#' Sentimental Words Plotting
#'
#' Plotting a column graph, shows words whose highest frequencies
#'
#' @param url URL of product
#' @param page_range a rage of number indicating starting page and ending page to extract reviews
#'
#' @return Plot
#'
#' @examples plotbing('https://www.amazon.co.uk/find-PHRL3236-Mens-Jumpers-Off-White/dp/B004I8VJ1Y?pf_rd_p=190f0313-4dcb-4239-b2ce-39f9d6bd3b5c&pd_rd_wg=NzF31&pf_rd_r=WJ0HCRPD99CTHV8XN0K0&ref_=pd_gw_unk&pd_rd_w=yoPcr&pd_rd_r=2a39592b-aee9-47b5-a65e-862257e0f4df&th=1',1:4)
#'
#' @export
plotbing <- function (url,page_range) {
  output_list <- multiple_scrape(url,page_range)
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


