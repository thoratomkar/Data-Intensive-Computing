#UI.R
#loading shiny library  
library(shiny)

ui <- fluidPage(
selectInput("var", 
            label = "Choose a map to display",
            choices = c("FLU vs COUGH Comparison","INFLUENZA vs FLUSEASON Comparison",
              "Part 2 Clinical vs Public", "CDC Map vs Tweets Heatmap",
                        "Clinical NY", "Clinical 18 weeks vs Clinical 52 weeks",
                        "Public 18 weeks vs Public 52 weeks","Mortality","ILI")
            ),


fluidRow(
  column(6, align="center",
         div(style="display: inline-block; width: 50%;",imageOutput("img1"), height=400, width=400)),
         div(style="display: inline-block; width: 50%; ",imageOutput("img2"), height=400, width=400)))
#   fluidRow
#           (cellWidths=c("50%","50%"),splitLayout(imageOutput("img1"),imageOutput("img2"))))
# )
