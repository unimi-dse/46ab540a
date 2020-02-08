``work in progress..``
`` ``
`` comeback later plz ``:woman_technologist:

# Check if Amazon rating is reliable

IfamazonratingsReliable is a package used for sentimentally analyzing reviews of UK Amazon products. Certain words from buyer's reviews will be assigned to either positive value or negative value using the Bing lexicon. If the number of negative words accounts for more than 40% of the total words, the product is considered as having got BAD reviews.


## Installation

```bash
# first install the R package "devtools" if not installed
devtools::install_github('unimi-dse/46ab540a')
```

## Usage

```R
# load the package
require(IfamazonratingsReliable)
```

## Find ASIN of products

Some Amazon products codes that can be used for the following functions 

``'B004I8VJ1Y'``
``'B07C366Z4V'``
``'B07Q41365C'``


You also can apply this package for any products from [Amazon UK](https://www.amazon.co.uk)
by finding its product code (i.e. [ASIN](https://www.datafeedwatch.com/blog/amazon-asin-number-what-is-it-and-how-do-you-get-it "See how to find ASIN of Amazon product")) from HTML link.



## Function

#### Function to extract data from one page
```
scrape_reviews(product_code,page_num)
```

 E.g.
  ``scrape_reviews('B004I8VJ1Y',10)``



#### Function to extract data from multiple pages
  ```
  multiple_scrape(product_code,page_rage)
  ```

E.g.
``multiple_scrape('B004I8VJ1Y',1:4)``


#### Function to check if the product got positive reviews in general
``` 
GetSentiment(product_code,page_rage)
```

E.g.
``GetSentiment('B004I8VJ1Y',1:4)``

#### Function to visualyze top negative and positive words
``` 
plotbing(product_code,page_rage)
```

E.g.
``plotbing('B004I8VJ1Y',1:10)``
## License
``GPL-3``
## Language
![](path/to/smallorb.png)

:sweat_smile:
