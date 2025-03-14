% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/theme-elements.R
\name{element}
\alias{element_cfb_logo}
\alias{element_cfb_headshot}
\alias{element_path}
\title{Theme Elements for Image Grobs}
\usage{
element_cfb_logo(
  alpha = NULL,
  colour = NA,
  hjust = NULL,
  vjust = NULL,
  color = NULL,
  size = 0.5
)

element_cfb_headshot(
  alpha = NULL,
  colour = NA,
  hjust = NULL,
  vjust = NULL,
  color = NULL,
  size = 0.5
)

element_path(
  alpha = NULL,
  colour = NA,
  hjust = NULL,
  vjust = NULL,
  color = NULL,
  size = 0.5
)
}
\arguments{
\item{alpha}{The alpha channel, i.e. transparency level, as a numerical value
between 0 and 1.}

\item{colour, color}{The image will be colorized with this color. Use the
special character \code{"b/w"} to set it to black and white. For more information
on valid color names in ggplot2 see
\url{https://ggplot2.tidyverse.org/articles/ggplot2-specs.html?q=colour#colour-and-fill}.}

\item{hjust, vjust}{The horizontal and vertical adjustment respectively.
Must be a numerical value between 0 and 1.}

\item{size}{The output grob size in \code{cm} (!).}
}
\value{
An S3 object of class \code{element}.
}
\description{
In conjunction with the \link[ggplot2:theme]{ggplot2::theme} system, the following \code{element_}
functions enable images in non-data components of the plot, e.g. axis text.
\itemize{
\item \code{element_cfb_logo()}: draws college team logos instead of their names.
\item \code{element_cfb_headshot()}: draws player headshots instead of their ESPN player IDs.
\item \code{element_path()}: draws images from valid image URLs instead of the URL.
}
}
\details{
The elements translate CFB team names or players' ESPN IDs
into logo images or player headshots, respectively.
}
\examples{
\donttest{
library(cfbplotR)
library(ggplot2)

team_abbr <- valid_team_names()
# remove conference logos from this example
team_abbr <- team_abbr[1:8]

df <- data.frame(
  random_value = runif(length(team_abbr), 0, 1),
  teams = team_abbr
)

# use logos for x-axis
ggplot(df, aes(x = teams, y = random_value)) +
  geom_col(aes(color = teams, fill = teams), width = 0.5) +
  scale_color_cfb(alt_colors = team_abbr) +
  scale_fill_cfb(alpha = 0.4) +
  theme_minimal() +
  theme(axis.text.x = element_cfb_logo())

# use logos for y-axis
ggplot(df, aes(y = teams, x = random_value)) +
  geom_col(aes(color = teams, fill = teams), width = 0.5) +
  scale_color_cfb(alt_colors = team_abbr) +
  scale_fill_cfb(alpha = 0.4) +
  theme_minimal() +
  theme(axis.text.y = element_cfb_logo())

#############################################################################
# Headshot Examples
#############################################################################
library(cfbplotR)
library(ggplot2)

# Silence an nflreadr message that is irrelevant here
old <- options(nflreadr.cache_warning = FALSE)

dfh <- data.frame(
  random_value = runif(9, 0, 1),
  player_id = c("4361182",
                  "4426385",
                  "4567048",
                  "4372519",
                  "4429013",
                  "4240069",
                  "4360932",
                  "4362874",
                  "4429299")
)

# use headshots for x-axis
ggplot(dfh, aes(x = player_id, y = random_value)) +
  geom_col(width = 0.5) +
  theme_minimal() +
  theme(axis.text.x = element_cfb_headshot())

# use headshots for y-axis
ggplot(dfh, aes(y = player_id, x = random_value)) +
  geom_col(width = 0.5) +
  theme_minimal() +
  theme(axis.text.y = element_cfb_headshot())
}
}
\seealso{
\code{\link[=geom_cfb_logos]{geom_cfb_logos()}}, \code{\link[=geom_cfb_headshots]{geom_cfb_headshots()}},
and \code{\link[=geom_from_path]{geom_from_path()}} for more information on valid team abbreviations,
player IDs, and other parameters.
}
