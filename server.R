library(quantmod)
shinyServer(
  function(input, output) { 
    ticker <- reactive({ c(input$textTicker) })
     start_date <- reactive({ as.Date(c(input$dateRange[1])) })
     end_date <- reactive({ as.Date(c(input$dateRange[2])) })
    output$plot1 <-renderPlot({         
       #ticker <- "COKE"    
       ticker_lookup <- getSymbols(ticker(), auto.assign=FALSE, from = start_date(), to = end_date() )       
       ticker_lookup2<- as.data.frame(cbind(ticker_lookup[,1], ticker_lookup[,2], ticker_lookup[,3], ticker_lookup[,4], ticker_lookup[,5], ticker_lookup[,6]))
       ticker_data <-  as.data.frame(cbind(date = rownames(ticker_lookup2), ticker_lookup2))
       colnames(ticker_data) <- c("date","open","high ","low ","close ","volume ","adjusted") 
       rownames(ticker_data) <- NULL
       rm(ticker_lookup2)       
       chartSeries(ticker_lookup)  
       addMACD() #Add Moving Average Convergence Divergence
#        addBBands() #Add Bolinger Bands 
    })  
    output$textOutputTicker <- renderText({input$textTicker})   
  }
)
