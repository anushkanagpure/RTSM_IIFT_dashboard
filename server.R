# Server
server = function(input, output, session) {
  
  #Structure
  output$structure = renderPrint(
    #structure
    data %>% 
      str()
  )
  #Summary
  output$summary = renderPrint(
    #Summary
    data %>% 
      summary()
    
  )
  #Data Table
  output$dataT = renderDataTable({
    datatable(data, options = list(scrollX = TRUE))
  })
  #stacked Histogram
  output$histplot = renderPlotly({# Histogram
    histogram <- data %>% 
      plot_ly() %>% 
      add_histogram(~get(input$var1)) %>% 
      layout(xaxis = list(title = input$var1))
    
    # Boxplot
    boxplot <- data %>% 
      plot_ly() %>% 
      add_boxplot(~get(input$var1)) %>% 
      layout(yaxis = list(showticklables = F))
    
    # Stacking plots using subplot
    subplot_list <- list(boxplot, histogram)  # Make sure to use a list
    
    # Create subplot
    subplot <- subplot(subplot_list, nrows = 2, shareX = TRUE) %>% 
      hide_legend() %>% 
      layout("Distribution Chart - Histogram and Boxplot",
             yaxis = list(title = "Frequency"))
    
  })
  output$bar <- renderPlotly({
    data %>% 
      plot_ly() %>% 
      add_bars(x=~State, y=~get(input$var1)) %>% 
      layout(title = paste("Yearwise data for", input$var1),
             xaxis = list(title = "Years"),
             yaxis = list(title = paste(input$var1, "Financial Data") ))
  })
  output$Liabilities_capital = renderPrint( summary(model_Liabilities_capital))
  output$Borrowing_loans = renderPrint( summary(model_Borrowing_loans))
  
}
