# Setting margins

ax <- list(
        domain = list(0.2, 1)
        
  )
        
m = list(
    l = 75,
    r = 75,
    b = 50,
    t = 50
) 


l <- list(
  font = list(
    #family = "Source Sans Pro",
    size = 12,
    color = '#ada2bb'))

f2 <- list(
  family =  "Source Sans Pro", 
  size = 14,
  color = '#ada2bb'
)


hline <- function(y = 0) {
  list(
    type = "dash+line", 
    x0 = 0, 
    x1 = 1, 
    xref = "paper",
    y0 = y, 
    y1 = y,
    name = 'SLA',
    line = list(color = 'rgb(189, 195, 199)', width = 1, dash = 'dash')
  )
}


p1 <- plot_ly(resolution_df, height=400,  hoverinfo="all") %>%
add_trace(x = ~DATE_BY_WEEK, y = ~average_resolution_time, type = 'scatter', mode = 'lines+markers', name = 'average resolution time', 
      marker = list(
      color = '#52BE80',
      symbol = 'diamond',
      size = 6,
      line = list(
        color = '#FDFEFE',
        width = 1)),
      line = list(color = '#52BE80', width=1.5),
      text = ~paste('Week:', DATE_BY_WEEK,
                        '</br>Average Resolution Time:', average_resolution_time,
                        '</br>Closed Tickets:', number_of_tickets)) %>%
      
add_trace(x = ~DATE_BY_WEEK, y = ~median_resolution_time, type = 'scatter', mode = 'lines+markers', name = 'median resolution time', 
      marker = list(
      color = "'#BB8FCE'",
      size = 6,
      line = list(
        color = '#FDFEFE',
        width = 1)),
      line = list(color = "#BB8FCE", width=1.5),
      text = ~paste('Week:', DATE_BY_WEEK,
                        '</br>Median Resolution Time:', median_resolution_time,
                        '</br>Closed Tickets:', number_of_tickets)) %>%

layout(shapes = list(hline(48)), xaxis = list(title = "", showgrid=FALSE, titlefont = f2, color = '#ada2bb'), autotick = TRUE, showlegend = FALSE, #legend = list(orientation = 'h', x = 0, y = 10, l ), 
       yaxis = list(title ='Ticket Resolution Time (Hours)', showgrid = TRUE, zeroline = FALSE, titlefont = f2, color = '#ada2bb'),
       margin = m, paper_bgcolor = '#201742', plot_bgcolor = '#201742',
       annotations = list(
        list(
          x = 0.05, 
          y = 0.45, 
          showarrow = FALSE, 
          text = "SLA Target (48 hrs)", 
          xref = "paper", 
          yref = "paper",
          arrowhead = 4,
          arrowsize = .5,
          ax = 10,
          ay = -9,
          xanchor = 'left',
          # Styling annotations' text:
          font = list(color = '#ffffff',
          family =  "Source Sans Pro",
          size = 12))))
        


p1