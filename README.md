
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dataset-amazon_trustpilot_reviews

This repository contains a dataset file
`amazon_com_reviews_trustpilot_20261026_anon.feather` with all available
English Trustpilot reviews for Amazon.com on October 26, 2026. The first
review is from August 27, 2007, while the last one is from October 26,
2026. This amounts to 32,632 reviews.

All rights to the data belong to Trustpilot. The data should not be used
for commercial purposes.

## Variables

The following eight variables are available:

1.  `User_ID`: an `int` column, giving the unique user ID; the same ID
    means that reviews were written by the same user.

2.  `Review_Date`: a `chr` variable giving the exact publishing time
    point of the review in `%Y-%m-%d %H:%M:%S` format (datetime to be
    interpreted as UTC).

3.  `Experience_Date`: a `chr` column giving the date in `%Y-%m-%d`
    format, on which the experience the review is written about was
    experienced; this date is entered manually by the review author.

4.  `User_Name`: a `chr` column giving the user name of the review
    author; a user name is not unique; note that user names have been
    anonymized in comparison to the original data.

5.  `User_Country`: a `chr` column giving the country of the review
    author in alpha-2 ISO 3166 format.

6.  `Review_Score`: an `int` column giving the score of the review; is
    always an integer from 1 through 5.

7.  `Review_Title`: a `chr` column giving the title of the review.

8.  `Review_Sentences`: a column with lists; each lists contains the
    individual sentences as `chr` entries of a review in correct order.

## Distribution information

The distribution of scores in the entire dataset is as depicted in
Figure <a href="#fig:scores">1</a>.

<div class="figure" style="text-align: center">

<img src="score_distribution.png" alt="Distribution of English Amazon.com Trustpilot scores between August 27, 2007, and October 26, 2026." width="80%" height="80%" />
<p class="caption">

<span id="fig:scores"></span>Figure 1: Distribution of English
Amazon.com Trustpilot scores between August 27, 2007, and October 26,
2026.
</p>

</div>

    #> Score key numbers:
    #> ******************
    #> Number of obs.     32632
    #> Mean                1.95
    #> Standard deviation  1.55
    #> Minimum             1.00
    #> 1st Quartile        1.00
    #> Median              1.00
    #> 3rd Quartile        3.00
    #> Maximum             5.00

<div class="figure" style="text-align: center">

<img src="year_review_distribution.png" alt="Review counts by year." width="80%" height="80%" />
<p class="caption">

<span id="fig:year-rev-number"></span>Figure 2: Review counts by year.
</p>

</div>

<div class="figure" style="text-align: center">

<img src="country_review_distribution.png" alt="Review counts by country." width="80%" height="80%" />
<p class="caption">

<span id="fig:country-rev-number"></span>Figure 3: Review counts by
country.
</p>

</div>
