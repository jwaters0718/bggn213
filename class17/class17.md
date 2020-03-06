Coronavirus
================
Jenny
3/4/2020

## Coronavirus

Here we analyze infection data for the 2019 novel Coronavirus COVID-19
(2019-nCoV) epidemic. The raw data is pulled from the Johns Hopkins
University Center for Systems Science and Engineering (JHU CCSE)
Coronavirus repository.

A CSV file is available here
<https://github.com/RamiKrispin/coronavirus-csv>

``` r
url <- "https://tinyurl.com/COVID-2019"
virus <- read.csv(url)

tail(virus)
```

    ##      Province.State Country.Region      Lat     Long       date cases      type
    ## 2881         Shanxi Mainland China  37.5777 112.2922 2020-03-05     2 recovered
    ## 2882        Sichuan Mainland China  30.6171 102.7103 2020-03-05    19 recovered
    ## 2883        Tianjin Mainland China  39.3054 117.3230 2020-03-05     4 recovered
    ## 2884       Victoria      Australia -37.8136 144.9631 2020-03-05     3 recovered
    ## 2885       Xinjiang Mainland China  41.1129  85.2401 2020-03-05     1 recovered
    ## 2886       Zhejiang Mainland China  29.1832 120.0934 2020-03-05    10 recovered

> Q1. How many total infected cases are there around the world?

``` r
total_cases <- sum(virus$cases)
total_cases
```

    ## [1] 155031

Lets have a look at the *$type* column

``` r
table(virus$type)
```

    ## 
    ## confirmed     death recovered 
    ##      1593       212      1081

> Q2. How many deaths linked to infected cases have there been?

``` r
inds <- virus$type =="death"
death_cases <- sum(virus[inds,"cases"])
death_cases
```

    ## [1] 3348

> Q3. What is the overall death rate?

Percent death

``` r
round(death_cases/total_cases * 100, 2)
```

    ## [1] 2.16

> Q4. What is the death rate in “Mainland China”?

``` r
library(tidyverse)
```

    ## Warning: package 'tidyverse' was built under R version 3.6.3

    ## -- Attaching packages ----------------------------------------- tidyverse 1.3.0 --

    ## v ggplot2 3.2.1     v purrr   0.3.3
    ## v tibble  2.1.3     v dplyr   0.8.4
    ## v tidyr   1.0.2     v stringr 1.4.0
    ## v readr   1.3.1     v forcats 0.5.0

    ## Warning: package 'tidyr' was built under R version 3.6.3

    ## Warning: package 'readr' was built under R version 3.6.3

    ## Warning: package 'purrr' was built under R version 3.6.3

    ## Warning: package 'dplyr' was built under R version 3.6.3

    ## Warning: package 'forcats' was built under R version 3.6.3

    ## -- Conflicts -------------------------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(DescTools)
```

    ## Warning: package 'DescTools' was built under R version 3.6.3

``` r
rates_all <- virus%>%
  group_by(Country.Region, type)%>%
  summarize_if(is.numeric, sum)%>%
  ungroup()%>%
  group_by(Country.Region)%>%
  mutate(rate = cases/sum(cases)*100)%>%
  ungroup()

rates_all%>%
  filter(Country.Region == "Mainland China",
         type == "death")%>%
  select(rate)
```

    ## # A tibble: 1 x 1
    ##    rate
    ##   <dbl>
    ## 1  2.22

> Q5. What is the death rate in Italy, Iran and the US?

``` r
rates_all%>%
  filter(Country.Region %in% c("Italy", "Iran", "US"),
           type == "death")
```

    ## # A tibble: 3 x 6
    ##   Country.Region type    Lat  Long cases  rate
    ##   <fct>          <fct> <dbl> <dbl> <int> <dbl>
    ## 1 Iran           death  480   795    107  2.45
    ## 2 Italy          death  602   168    148  3.35
    ## 3 US             death  325. -854.    12  4.98

Submit a link to your knited GitHub document (i.e. the md file)
