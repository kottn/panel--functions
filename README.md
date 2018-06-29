# panel-functions
panel functions for R


## Usage
```r
source("panel-functions.R")
```

### Call examples

```r
par(pty='s')

pairs(USJudgeRatings[1:5], upper.panel=panel.cor, lower.panel=function(...) panel.smooth(..., col.smooth=gray(.5), lty=1), diag.panel=panel.dist_summary, cex.labels = 2, font.labels=2)
```
```r
pairs(iris[1:4], upper.panel=panel.cor, lower.panel=function(...) panel.smooth(..., col.smooth=gray(.5), lty=1), diag.panel=panel.dist_summary, cex.labels = 2, font.labels=2)
```
### use spearman correlation calculation instead of default person:
```r
pairs(iris[1:4], upper.panel=function(...) panel.cor(..., cor.method="spearman"), lower.panel=function(...) panel.smooth(..., col.smooth=gray(.5), lty=1), diag.panel=panel.dist_summary, cex.labels = 2, font.labels=2)
```
### color iris specis: note location of 'col=' argument
```r
pairs(iris[1:4], upper.panel=panel.cor, lower.panel=function(...) panel.smooth(..., col.smooth=gray(.5), lty=1, pch=16, col=c("red4", "green3", "blue4")[unclass(iris$Species)]), diag.panel=panel.dist_summary, cex.labels = 2, font.labels=2 )
```
```r
pairs(trees, upper.panel=panel.cor, lower.panel=function(...) panel.smooth(..., col.smooth=gray(.5), lty=1), diag.panel=panel.dist_summary, cex.labels = 2, font.labels=2)
```
```r
pairs(swiss, upper.panel=panel.cor, lower.panel=function(...) panel.smooth(..., 
col.smooth=gray(.5), lty=1), diag.panel=panel.dist_summary, cex.labels = 2, font.labels=2)
```

### using formula notation:
```r
pairs( ~ Fertility + Education + Catholic, data=swiss, upper.panel=panel.cor, lower.panel=function(...) panel.smooth(..., col.smooth=gray(.5), lty=1), diag.panel=panel.dist_summary, cex.labels = 2, font.labels=2)
```

```r
pairs(longley, upper.panel=panel.cor, lower.panel=function(...) panel.smooth(..., 
col.smooth=gray(.5), lty=1), diag.panel=panel.dist_summary, cex.labels = 2, font.labels=2)
```

