# bingo
Generate bingo cards.

Currently has built-in rectangular of 9x3 and 90 balls.


## Installation

Install from GitHub with:

```{r eval = FALSE}
# install.packages("devtools")
devtools::install_github("sestelo/bingo")
```

## Casco Vello Alto Vigo Example

```{r}
library(bingo)

## generate 10 bingo cards
cards <- bingo(10)


## checking if there are equal cards
check_equal_cards(cards)

## print them to PDF
plot(cards)
```

And the result is:

![](img/bingo-1.pdf)

