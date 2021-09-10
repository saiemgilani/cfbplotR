
<!-- README.md is generated from README.Rmd. Please edit that file -->

# **cfbplotR**

<!-- badges: start -->
<!-- [![CRAN status](https://img.shields.io/cran/v/cfbplotR?style=flat-square&logo=R&label=CRAN)](https://CRAN.R-project.org/package=cfbplotR) -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg?style=flat-square)](https://lifecycle.r-lib.org/articles/stages.html)
<!-- [![R build status](https://img.shields.io/github/workflow/status/Kazink36/cfbplotR/R-CMD-check?label=R%20check&style=flat-square&logo=github)](https://github.com/Kazink36/cfbplotR/actions) -->
<!-- badges: end -->

The code for this package was copied heavily from
[nflplotR](https://nflverse.github.io/nflplotR/index.html) with minor
changes to support college football team logos.

The goal of cfbplotR is to provide functions and geoms that help
visualization of CFB related analysis. It provides a ggplot2 geom that
does the heavy lifting of plotting CFB logos in high quality, with
correct aspect ratio and possible transparency.

## Installation

<!-- You can install the released version of cfbplotR from [CRAN](https://CRAN.R-project.org) with: -->
<!-- ``` r -->
<!-- install.packages("cfbplotR") -->
<!-- ``` -->
<!-- And the development version from [GitHub](https://github.com/) with: -->
<!-- ``` r -->
<!-- # install.packages("devtools") -->
<!-- devtools::install_github("Kazink36/cfbplotR") -->
<!-- ``` -->

You can install `cfbplotR` with

``` r
if (!require("remotes")) install.packages("remotes")
remotes::install_github("Kazink36/cfbplotR")
```

## Using cfbplotR

[You can follow this tutorial to see several different uses for
`cfbplotR`.](https://kazink36.github.io/cfbplotR/articles/tutorial.html)
The key function in the package is `geom_cfb_logo()` which will add
college football team logos to a ggplot.

``` r
library(cfbplotR)
library(ggplot2)
team <- valid_team_names()
team <- team[1:32]
df <- data.frame(
  a = rep(1:8, 4),
  b = sort(rep(1:4, 8), decreasing = TRUE),
  teams = team
)

# keep alpha == 1 for all teams including an "A"
matches <- grepl("A", team)
df$alpha <- ifelse(matches, 1, 0.9)
# change color of all teams including an "o" to grey
matches <- grepl("o", team)
df$color <- ifelse(matches, "grey",NA)

 ggplot(df, aes(x = a, y = b)) +
   geom_cfb_logos(aes(team = teams, color = color, alpha = alpha), width = 0.075) +
   geom_label(aes(label = teams), nudge_y = -0.35, alpha = 0.5) +
   scale_color_identity() +
   theme_void() 
```

<img src="man/figures/README-example-1.png" width="100%" />
