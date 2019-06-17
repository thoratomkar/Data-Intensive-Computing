#SERVER.R
library(shiny)
library(ggplot2)
library(gridExtra)


function(input, output) {
  
  output$img1 <- renderImage({   #This is where the image is set 
    if(input$var == "Part 2 Clinical vs Public")
    {            
      list(src = "clinical.png",height = 510, width = 510)
    }  
    else if(input$var == "CDC Map vs Tweets Heatmap")
    {
      list(src = "cdcheatmap.png", height = 510, width = 510)
    }
    else if(input$var == "FLU vs COUGH Comparison")
    {
      list(src = "flu.png", height = 510, width = 510)
    }
    else if(input$var == "INFLUENZA vs FLUSEASON Comparison")
    {
      list(src = "influenza.png", height = 510, width = 510)
    }
    else if(input$var == "Clinical 18 weeks vs Clinical 52 weeks"){
      list(src = "clinical.png", height = 510, width = 510)
    }
    else if(input$var == "Clinical NY"){
      list(src = "clinicalNY.png", height = 580, width = 580)
    }
    else if(input$var == "Mortality"){
      list(src = "mortality.jpeg", height = 580, width = 580)
    }
    else if(input$var == "ILI"){
      list(src = "Deaths.png", height = 580, width = 580)
    }
    else if(input$var == "Public 18 weeks vs Public 52 weeks"){
      list(src = "public.jpeg", height = 510, width = 510)
    }
  },deleteFile = FALSE)
  
  
  output$img2 <- renderImage({   #This is where the image is set 
    if(input$var == "Part 2 Clinical vs Public")
    {            
      list(src = "public.jpeg",height = 510, width = 510)
    }                                        
    else if(input$var == "CDC Map vs Tweets Heatmap")
    {
      list(src = "tweets.png", height = 510, width = 510)
    }
    else if(input$var == "FLU vs COUGH Comparison")
    {
      list(src = "cough.png", height = 510, width = 510)
    }
    else if(input$var == "INFLUENZA vs FLUSEASON Comparison")
    {
      list(src = "fluseason.png", height = 510, width = 510)
    }
    else if(input$var == "Clinical 18 weeks vs Clinical 52 weeks"){
      list(src = "clinical52.png", height = 510, width = 510)
    }
    else if(input$var == "Mortality"){
      list(src = "temp.png", height = 510, width = 510)
    }
    else if(input$var == "Clinical NY"){
      list(src = "temp.png", height = 510, width = 510)
    }
    else if(input$var == "ILI"){
      list(src = "temp.png", height = 510, width = 510)
    }
    else if(input$var == "Public 18 weeks vs Public 52 weeks"){
      list(src = "public52.jpeg", height = 510, width = 510)
    }
  },deleteFile = FALSE)
}