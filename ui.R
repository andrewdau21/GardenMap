


# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("2022 Garden"),
  
  # Sidebar with a slider input for number of bins 
 
    mainPanel(
      plotlyOutput("gardenmap"),
      #verbatimTextOutput("plantselect"),
      dataTableOutput("fulltable")
    )
  
)

