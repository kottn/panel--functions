# _/  _/  _/  _/  _/  _/  _/  _/  _/  _/  _/  _/  _/  _/  _/  _/  _/  _/
#
#                            panel functions
#
#   Last change: 2017.06.30
# _/  _/  _/  _/  _/  _/  _/  _/  _/  _/  _/  _/  _/  _/  _/  _/  _/  _/


panel.dist_summary <- function(x, ...) {
    usr <- par("usr"); on.exit(par(usr))
    par(usr = c(usr[1:2], 0, 3) )
    hist(x, probability=T, add=T)

    ### default color and line style for density plot
    density.col = 'gray'
    density.lty = 3

    ### is this a normally distributed dataset?
    ### if so, change the color of the density plot
    ### The test rejects the null hypothesis if W is too small.
    s.W <- shapiro.test(x)$statistic
    if((s.W > 0.91) == TRUE) {
      density.col = 'gray'
      density.lty = 1
    }


    ### compute and plot density
    d <- density(x)
    dy <- d$y / max(d$y) * .5
    lines(d$x, dy, col=density.col, lty=density.lty)

    ### get a small increment to use in the next tests:
    delta <- abs(min(x) - max(x)) / 100
    y_mean <- dy[d$x < mean(x) + delta & d$x > mean(x) - delta][1]
    y_median <- dy[d$x < median(x) + delta & d$x > median(x) - delta][1]

    debug
    #print(y_median)

    ### add points on the density plot for the mean and median
    points(c(mean(x), median(x)),
           c(y_mean, y_median),
           col=c('red', 'orange'), pch=16)

    ### add a boxplot
    boxplot(x, horizontal=TRUE, boxwex=0.3, add=T)

    ### debugging
    #print(s.W)
}


panel.cor <- function(x, y, digits=2, prefix="", cex.cor, cor.method="pearson") {
    usr <- par("usr"); on.exit(par(usr))
    par(usr = c(0, 1, 0, 1))
    r <- abs(cor(x, y, method=cor.method))
    txt <- format(c(r, 0.123456789), digits=digits)[1]
    txt <- paste(prefix, txt, sep="")
    if(missing(cex.cor)) cex <- 0.8/strwidth(txt)
    text(0.5, 0.5, txt, cex = cex * r, col='gray')

    ### might be interesting to use ks.test
    ### http://www.physics.csbsju.edu/stats/KS-test.html
}
