# Dashboard UI
ui <- dashboardPage(
  
  dashboardHeader(
    title = "Assets and Liabilities of EXIM Bank of India",
    titleWidth = 650, 
    tags$li(class = "dropdown", tags$a(href = "https://www.youtube.com/channel/UCyf8dirG3tONzbkktNX9eWQ", icon("youtube"), "Channel", target = "_blank")),
    tags$li(class = "dropdown", tags$a(href = "https://www.linkedin.com/company/export-import-bank-of-india/", icon("linkedin"), "Official ID", target = "_blank")),
    tags$li(class = "dropdown", tags$a(href= "https://github.com/anushkanagpure/RTSM_IIFT_dashboard", icon("github"), "Source code and Report", target = "_blank"))
  
    ),
  dashboardSidebar(
    sidebarMenu(
      id = "sidebar",
      menuItem("Dataset", tabName = "data", icon = icon("database")),
      menuItem(text = "Visualization", tabName = "viz", icon = icon("chart-line")),
      menuItem(text = "Analysis", tabName = "anova", icon = icon("chart-line")),
      selectInput(inputId = "var1", label = "Select the Crime", choices = choices1, selected = "Rape - 2015")
    )
  ),
  
  dashboardBody(
    tabItems(
      #First tab item
      tabItem(tabName = "data",
              #tab box
              tabBox(id = "t1", width = 12,
                     tabPanel("About",
                              fluidRow(
                                column(width = 8,
                                       tags$br() , 
                                       tags$a("Assets and Liabilities of EXIM bank of India- The Export-Import Bank of India (EXIM Bank) is pivotal in supporting India's international trade by offering specialized financial assistance to exporters. Its assets mainly comprise loans for export activities, investments, and foreign exchange reserves for risk management. Liabilities include deposits, borrowings, and contingent liabilities from guarantees. EXIM Bank's balance sheet underscores its dedication to strengthening India's exports and fostering economic growth through targeted financial aid and risk mitigation.")),
                                column(width = 4, tags$br() ,
                                       tags$p("Abbrevations used are (RBI) Reserved Bank of India and (GOI) Government of India")
                                )
                              )  
                              
                     ),
                     tabPanel("Data",dataTableOutput("dataT")),
                     tabPanel("Structure",verbatimTextOutput("structure")),
                     tabPanel("Summary",verbatimTextOutput("summary")))),
      tabItem(tabName = "viz",
              #tab box
              tabBox(id = "t1", width = 12,
                     tabPanel("Financials of EXIM by Years",value = "trends", plotlyOutput("bar")),
                     tabPanel("Distribution", value = "distro",plotlyOutput("histplot")))),
      tabItem(tabName = "anova",
              tabBox(id = "t1", width = 12,
                     tabPanel("About",
                              fluidRow(
                                column(width = 8,
                                       tags$br() , 
                                       tags$a("This part of dashboard compares the assets and liabilities using test of Anova")),
                                column(width = 4, tags$br())
                     
                     )),
                     tabPanel("Liabilities_capital", verbatimTextOutput("Liabilities_capital")),
                     tabPanel("Borrowing_loans", verbatimTextOutput("Borrowing_loans"))
                     
    )
    
  )
)))
