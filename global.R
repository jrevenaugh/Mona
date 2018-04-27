# Mona - Shiny app illustrating the use of the SVD as a 2D filter.
#        Useful for demonstrating principal components.
#

require(tidyverse, quiet = TRUE)
require(shiny, quiet = TRUE)

# Establish defaults
theme_set(theme_bw())
options(warn = -1)

# Make olor palette and load data.
pal <- gray.colors(256, start = 0, end = 1)
mona <- readRDS("mona_lisa_matrix")
