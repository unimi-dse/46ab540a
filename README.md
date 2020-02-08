``work in progress..``
``
``
`` comeback later plz :D``

# Check if Amazon rating is reliable

IfamazonratingsReliable is a package used for sentimentally analyzing reviews of UK Amazon products. Certain words from buyer's reviews will be assigned to either positive value or negative value using the Bing lexicon. If the number of negative words accounts for more than 40% of the total words, the product is considered as having got BAD reviews.

``
comparing to star rating is ....
pending T.T
``
## Installation

```bash
# first install the R package "devtools" if not installed
devtools::install_github('unimi-dse/01a62bb0')
```

## Usage

```R
# load the package
require(IfamazonratingsReliable)
```

## Find ASIN of products

```
# Amazon products codes that can be used for the following functions. 
'B004I8VJ1Y'
'B07C366Z4V'
'B07Q41365C'
```

You also can apply this package for any products from [Amazon UK](https://www.amazon.co.uk)
by finding its product code (i.e. [ASIN](https://www.datafeedwatch.com/blog/amazon-asin-number-what-is-it-and-how-do-you-get-it)) from HTML link.



## Function

```

scrape_reviews(product_code,page_num)

# example
scrape_reviews('B004I8VJ1Y',10)
````


```
multiple_scrape(product_code,page_rage)

#example
#multiple_scrape('B004I8VJ1Y',1:4)
```

```
GetSentiment(product_code,page_rage)

# example
GetSentiment('B004I8VJ1Y',1:4)

``` 
## License
``GPL-3``
