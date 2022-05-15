server <- function(input, output) {
  
 output$fulltable <- DT::renderDataTable({
   
    gs4_auth(cache = ".secrets", email = "andrew.dau21@gmail.com")
   ss <- read_sheet("https://docs.google.com/spreadsheets/d/1RYmEGSseibOj4BvgUOTN-mAQO93qDcdac-iZ8ObbG70/edit#gid=236015913",
                    sheet = "Planting Log Full")
   
  

 })
 
 output$gardenmap <- renderPlotly({
   
   gs4_auth(cache = ".secrets", email = "andrew.dau21@gmail.com")
   ss <- read_sheet("https://docs.google.com/spreadsheets/d/1RYmEGSseibOj4BvgUOTN-mAQO93qDcdac-iZ8ObbG70/edit#gid=236015913",
                    sheet = "Planting Log Itemized")
   

   
   
 
   df_map_merged <- df_map %>% left_join(ss, by = c("id" = "Plant #"))
   
   df_map_merged <- df_map_merged %>%
     mutate(textdat = paste0('<b>Plant</b>:', Name, '<br><b>Variety</b>:', Variety,
                             '<br><b>Plant Date</b>:', Date))
   
   
   fig <- plot_ly(data=df_map_merged, x = ~x, y = ~y, key = ~id,
                  text = ~textdat,
                  hovertemplate = paste('%{text}'),
                  marker = list(size = 10,
                                color = 'rgba(255, 182, 193, .9)',
                                line = list(color = 'rgba(152, 0, 0, .8)',
                                            width = 2))) %>%
     layout(xaxis = list(title = "", range = list(0,11), showticklabels=FALSE, gridcolor = 'ffff',zerolinecolor = '#ffff'),
            yaxis = list(title = "", range = list(0,5), showticklabels = FALSE, zerolinecolor = '#ffff'))
   
   fig
   
 })
 
 
 output$clickevent <- renderPrint({
   event_data("plotly_click")
   
 })
 
 observeEvent(event_data("plotly_click"),{
   clickdata <- event_data("plotly_click")
   
   gs4_auth(cache = ".secrets", email = "andrew.dau21@gmail.com")
   ss <- read_sheet("https://docs.google.com/spreadsheets/d/1RYmEGSseibOj4BvgUOTN-mAQO93qDcdac-iZ8ObbG70/edit#gid=236015913",
                    sheet = "Planting Log Itemized")
   
   
   datatoprint <- ss %>% filter(ss$`Plant #` == clickdata$key)
   
   #abc <<- datatoprint
   output$plantselect <- renderPrint({
    paste0(datatoprint$'Plant Name', " - ", datatoprint$'Plant Variety', " Planted: " , datatoprint$'Plant Date')
     
   })
 })
 
}
