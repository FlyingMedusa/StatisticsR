# First plot -------

Fibonacci <- c( 1,1,2,3,5,8,13 )
plot( Fibonacci )

plot( x = Fibonacci,
      main = "You specify title using the ’main’ argument",
      sub = "The subtitle appears here! (Use the ’sub’ argument for this)",
      xlab = "The x-axis label is ’xlab’",
      ylab = "The y-axis label is ’ylab’"
)

# Fibonacci with font options -----

plot( x = Fibonacci, # the data to plot
      main = "The first 7 Fibonacci numbers", # the title
      xlab = "Position in the sequence", # x-axis label
      ylab = "The Fibonacci number", # y-axis label
      font.main = 1, # plain text for title
      cex.main = 1, # normal size for title
      font.axis = 2, # bold text for numbering
      col.lab = "gray50" # grey colour for labels
)

# Plot type options (o = overplotted) -----

plot( x = Fibonacci, # the data to plot
      main = "The first 7 Fibonacci numbers", # the title
      type = "o",
      xlab = "Position in the sequence", # x-axis label
      ylab = "The Fibonacci number", # y-axis label
      font.main = 1, # plain text for title
      cex.main = 1, # normal size for title
      font.axis = 2, # bold text for numbering
      col.lab = "gray50" # grey colour for labels
)

# Play with the settings ---------

plot( x = Fibonacci, # the data set
      type = "b", # plot both points and lines
      col = "blue", # change the plot colour to blue
      pch = 19, # plotting character is a solid circle
      cex = 5, # plot it at 5x the usual size
      lty = 2, # change line type to dashed
      lwd = 4 # change line width to 4x the usual
)
# 
# No "annotation" but Add frame --------
# 
plot( x = Fibonacci, # the data
      xlim = c(0, 15), # expand the x-scale
      ylim = c(0, 15), # expand the y-scale
      ann = FALSE, # delete all annotations
      axes = FALSE, # delete the axes
      frame.plot = TRUE # but include a framing box
)

# Box type ---------

plot( x = Fibonacci, # the data
      xaxt = "n", # don’t draw the x-axis
      bty = "]", # keep bottom, right and top of box only
      las = 1 # rotate the text
)

# Histograms  ------

load( "../lsr/data/aflsmall.Rdata" ) # adjust your path as needed
library(lsr)
hist( afl.margins )
hist( afl.margins, breaks = 3 )
hist( afl.margins, breaks = 0:116 ) # 1-point wide only, complete info

# A beautified AFL histogram  -------

hist( x = afl.margins,
      main = "2010 AFL margins", # title of the plot
      xlab = "Margin", # set the x-axis label
      density = 10, # draw shading lines: 10 per inch
      angle = 40, # set the angle of the shading lines is 40 degrees
      border = "gray20", # set the colour of the borders of the bars
      col = "gray80", # set the colour of the shading lines
      labels = TRUE, # add frequency labels to each bar
      ylim = c(0,40) # change the scale of the y-axis
)

# Stem and leaf plots (old school but still useful) -------
load("../lsr/data/aflsmall.Rdata")
stem( afl.margins )

# various options
stem( afl.margins, scale = 0.25 ) 
stem( x = afl.margins, width = 20 )

# Boxplots  -----

summary( afl.margins )
boxplot( x = afl.margins, range = 100 ) # default is 1.5
boxplot( x = afl.margins) # default is 1.5

# Play with the settings -----

boxplot( x = afl.margins, # the data
         xlab = "AFL games, 2010", # x-axis label
         ylab = "Winning Margin", # y-axis label
         border = "grey50", # dim the border of the box
         frame.plot = FALSE, # don’t draw a frame
         staplewex = 0, # don’t draw staples
         whisklty = 1 # solid line for whisker
)

# Multiple boxplot - formula notation -------

load( "../lsr/data/aflsmall2.Rdata" ) # adjust your path as needed
str(afl2)

boxplot(formula = margin ~ year, data = afl2)

# Subtler version -------

boxplot( formula = margin ~ year, # the formula
         data = afl2, # the data set
         xlab = "AFL season", # x axis label
         ylab = "Winning Margin", # y axis label
         frame.plot = FALSE, # don’t draw a frame
         staplewex = 0, # don’t draw staples
         staplecol = "white", # (fixes a tiny display issue)
         boxwex = .75, # narrow the boxes slightly
         boxfill = "grey80", # lightly shade the boxes
         whisklty = 1, # solid line for whiskers
         whiskcol = "grey70", # dim the whiskers
         boxcol = "grey70", # dim the box borders
         outcol = "grey70", # dim the outliers
         outpch = 20, # outliers as solid dots
         outcex = .5, # shrink the outliers
         medlty = "blank", # no line for the medians
         medpch = 20, # instead, draw solid dots
         medlwd = 1.5 # make them larger
)

# Scatterplots --------

load( "../lsr/data/parenthood.Rdata" ) # adjust your path as needed
plot( x = parenthood$dan.sleep, # data on the x-axis
      y = parenthood$dan.grump # data on the y-axis
)

# Formula notation variant: less typing and reasonable axis labels, too
plot(dan.grump ~ dan.sleep, data = parenthood)

# Fine-tuned scatterplot -----

plot( x = parenthood$dan.sleep, # data on the x-axis
      y = parenthood$dan.grump, # data on the y-axis
      xlab = "My sleep (hours)", # x-axis label
      ylab = "My grumpiness (0-100)", # y-axis label
      xlim = c(0,12), # scale the x-axis
      ylim = c(0,100), # scale the y-axis
      pch = 20, # change the plot character
      col = "gray50", # dim the dots slightly
      frame.plot = FALSE # don’t draw a box
)
# Add line manually -----
lines( x = c(4,9.5), # the horizontal locations
       y = c(93,37), # the vertical locations
       lwd = 2 # line width
) # there's a better way using abline(lm(...))

# Scatterplot using the `car` package -------

car::scatterplot(dan.grump ~ dan.sleep, data=parenthood, smooth=FALSE)

# Several variables at once -------

pairs(parenthood)
# the layout is modeled on a correlation matrix:
cor(parenthood) # calculate correlation matrix
PerformanceAnalytics::chart.Correlation(parenthood) # correlation scatterplots and visuals

# Barplot: bar graphs --------

(freq <- tabulate(afl.finalists)) # get frequencies with tabulate

(teams <- levels(afl.finalists)) # get team names

barplot(height = freq, # the frequencies
        names.arg = teams, # the labels
        las = 2 # rotate the labels
) # but some names don't fit, fix this

barplot(table(afl.finalists), las = 2) # a quicker way!

# Using par()-------

par.save <- par(no.readonly = TRUE) # save graphics parameters so they can be recovered
par(mar = c( 10.1, 4.1, 4.1, 2.1)) # set plot margins

barplot( table(afl.finalists), # the data to plot
         las = 2, # rotate the labels
         ylab = "Number of Finals", # y axis label
         main = "Finals Played, 1987-2010", # figure title
         density = 50, # shade the bars
         angle = 20 # shading lines angle
)
par(par.save) # bring back original graphics settings

# Saving plots: use the export function -----

# demo pdf and emf export, paste into Word

dev.list() # list of open graphics devices
# you'll only need this when generating many graphs in batches
# if in need, consult the manual
