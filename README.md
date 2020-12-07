# Check if Amazon rating is reliable

IfamazonratingsReliable is a package used for sentimentally analyzing reviews of [Amazon UK](https://www.amazon.co.uk "Go to Amazon UK now") products. Certain words from buyer's reviews will be assigned to either positive value or negative value using Bing lexicon. If the number of negative words accounts for more than 40% of the total words, the product is considered as having got BAD reviews.


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

## Function

#### Function to extract reviews from one page
```
scrape_reviews(url,page_num)
```
 <details>
  <summary>Click to copy example </summary>
  scrape_reviews('https://www.amazon.co.uk/NatraCure-5-Toe-Moisturising-Socks-Cracked/dp/B00O81S77A/ref=pd_rhf_cr_p_img_4?_encoding=UTF8&psc=1&refRID=VJCM7BVD23A999WADERA',2)
</details> 




#### Function to extract reviews from multiple pages
  ```
  multiple_scrape(url,page_rage)
  ```
   <details>
  <summary>Click to copy example </summary>
  multiple_scrape('https://www.amazon.co.uk/find-PHRL3236-Mens-Jumpers-Off-White/dp/B004I8VJ1Y?pf_rd_p=190f0313-4dcb-4239-b2ce-39f9d6bd3b5c&pd_rd_wg=NzF31&pf_rd_r=WJ0HCRPD99CTHV8XN0K0&ref_=pd_gw_unk&pd_rd_w=yoPcr&pd_rd_r=2a39592b-aee9-47b5-a65e-862257e0f4df&th=1',1:4)
</details> 


#### Function to check if the product got positive reviews in general
``` 
GetSentiment(url,page_rage)
```
 <details>
  <summary>Click to copy example </summary>
 GetSentiment('https://www.amazon.co.uk/find-PHRL3236-Mens-Jumpers-Off-White/dp/B004I8VJ1Y?pf_rd_p=190f0313-4dcb-4239-b2ce-39f9d6bd3b5c&pd_rd_wg=NzF31&pf_rd_r=WJ0HCRPD99CTHV8XN0K0&ref_=pd_gw_unk&pd_rd_w=yoPcr&pd_rd_r=2a39592b-aee9-47b5-a65e-862257e0f4df&th=1',1:2)
</details> 

#### Function to visualize negative and positive words
``` 
plotbing(url,page_rage)
```
 <details>
  <summary>Click to copy example </summary>
  plotbing('https://www.amazon.co.uk/find-PHRL3236-Mens-Jumpers-Off-White/dp/B004I8VJ1Y?pf_rd_p=190f0313-4dcb-4239-b2ce-39f9d6bd3b5c&pd_rd_wg=NzF31&pf_rd_r=WJ0HCRPD99CTHV8XN0K0&ref_=pd_gw_unk&pd_rd_w=yoPcr&pd_rd_r=2a39592b-aee9-47b5-a65e-862257e0f4df&th=1',1:4)
</details> 

## License
``GPL-3``

## Author
``Nguyen QA``

:octocat: 
[jyanqa](https://github.com/jyanqa "Follow me on Github")


 **_Note:_**  `` Only for Mac OS users`` This package uses X11 library (including tcltk), thus [XQuartz](https://www.xquartz.org "Download") is required to be installed since it is no longer part of OS X. Read on [R CRAN](https://cran.r-project.org/bin/macosx/ "R for Mac OS X") for  more details.

