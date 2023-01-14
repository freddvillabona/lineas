

library("ggplot2")
library("lubridate")

UK <- read.csv("Total_uk.csv", comment.char="#")
UK$Date <- lubridate::ymd_hms(UK$Date)

GLOBAL <- read.csv("Total_GLOBAL.csv", comment.char="#")
GLOBAL$Date <- lubridate::ymd_hms(GLOBAL$Date)

a <- ggplot(UK, 
            aes(Date, n, colour=(n>20))) + 
  geom_line(aes(group=1), size=.1) +
  scale_colour_manual(values = c("blue", "red")) +
  xlab("2020") +
  ylab("Cantidad") +
  theme(legend.position="none") +
  ggtitle("<span style='font-size: 21pt;'> <b>COVID-19: tuits por minuto (Reino Unido) </b></font>") +
  theme(plot.title = element_markdown(),
        
        panel.background = element_rect(fill = 'white', color = 'gray'),
        panel.grid.major = element_line(color = 'white', linetype = 'dotted'),
        panel.grid.minor = element_line(color = 'white', size = .2),
        
        axis.text = element_text(size = 13),
        axis.title = element_text(size = 14)
        
  )

b <- ggplot(GLOBAL, 
            aes(Date, n, colour=(n>750))) + 
  geom_line(aes(group=1), size=.1) +
  scale_colour_manual(values = c("blue", "red")) +
  xlab("2020") +
  ylab("Cantidad") +
  theme(legend.position="none") +
  ggtitle("<span style='font-size: 21pt;'> <b>COVID-19: tuits por minuto (Todo el mundo) </b></font>") +
  theme(plot.title = element_markdown(),
        
        panel.background = element_rect(fill = 'white', color = 'gray'),
        panel.grid.major = element_line(color = 'white', linetype = 'dotted'),
        panel.grid.minor = element_line(color = 'white', size = .2),
        
        axis.text = element_text(size = 13),
        axis.title = element_text(size = 14)
        
  )


library("patchwork")

a /
  b
