Orders_everyhour<-orders%>%group_by(order_hour_of_day)%>%summarise(Number_of_Orders=n())%>%mutate(Percentage_of_orders=(Number_of_Orders*100/nrow(orders)))

#Visualization for number of orders at every hour of the day and every day of the week

# referenced from: http://zoonek2.free.fr/UNIX/48_R/03.html

x<-Orders_everyhour$Percentage_of_orders
clock.plot <- function (x, col = rainbow(n,s=1,v=1,start=0,end=max(1,n-1)/n,alpha=0.5), ...) {
  if( min(x)<0 ) x <- x - min(x)
  if( max(x)>1 ) x <- x/max(x)
  n <- length(x)
  if(is.null(names(x))) names(x) <- 0:(n-1)
  m <- 1.05
  plot(0, 
       type = 'n', # do not plot anything
       xlim = c(-m,m), ylim = c(-m,m), 
       axes = F, xlab = '', ylab = '', ...)
  a <- pi/2 - 2*pi/200*0:200
  polygon( cos(a), sin(a) )
  v <- .02
  a <- pi/2 - 2*pi/n*0:n
  segments( (1+v)*cos(a), (1+v)*sin(a), 
            (1-v)*cos(a), (1-v)*sin(a) )
  segments( cos(a), sin(a), 
            0, 0, 
            col = 'light grey', lty = 3) 
  ca <- -2*pi/n*(0:50)/50
  for (i in 1:n) {
    a <- pi/2 - 2*pi/n*(i-1)
    b <- pi/2 - 2*pi/n*i
    polygon( c(0, x[i]*cos(a+ca), 0),
             c(0, x[i]*sin(a+ca), 0),
             col=col[i] )
    v <- .1
    text((1+v)*cos(a), (1+v)*sin(a), names(x)[i])
  }
}
clock.plot(x, 
           main = "Peak Ordering Hours")