shinyUI(pageWithSidebar(
  headerPanel("Quantmod Stock Lookup"),
  sidebarPanel(
    textInput("textTicker", label = h3("Ticker Lookup"),value="AAPL"), 
    dateRangeInput("dateRange",label="Enter date range",start = "2000-01-01",end   = Sys.Date()-1),
    submitButton('Submit')
     ),
  mainPanel(
#     p('Ticker Symbol:'),
    textOutput('textOutputTicker'), 
    textOutput('text1'),
    textOutput('text2'),
    plotOutput('plot1')
  )
))
