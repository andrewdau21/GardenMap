ui <- navbarPage("2022 Garden",
           tabPanel("Map",
                    plotlyOutput("gardenmap")),
           tabPanel("Table",
                    dataTableOutput("fulltable"))
           )




