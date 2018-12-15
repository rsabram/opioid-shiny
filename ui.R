dashboardPage(
  dashboardHeader(title = "Opioid Analysis"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("State by State Analysis", tabName = "states", icon = icon("map-marked-alt")),
      menuItem("Connecticut", tabName = "ct", icon = icon("map-marker-alt")),
      menuItem("Script Analysis by Gender", tabName = "scripts", icon = icon("prescription")),
      menuItem("Further Reading", tabName = "sources", icon = icon("book-open"))
    )),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "states",
              title = "State", status = "primary", solidHeader = TRUE,
              "Select a State to see opioids prescribed", width=3,
              fluidRow(
                box(
              selectInput("state", 
                          label = "State:", 
                          choices = state_info$Abbrev,
                          selected = 'TN'))),
              fluidRow(
                box(
                  title = "Opioids Prescribed in 2014", status = "primary", solidHeader = TRUE,width=40,
                  plotOutput("drugbars", height = 500, width = 800)
                )
              )
      ),
      
      # Second tab content
      tabItem(tabName = "ct",
              h3("In order to analyze a correlation between type of opioids prescribed and overdose deaths, we pulled in some external data from Connecticut that includes the toxicity reports. These reports list what drugs were found in the systems of the overdose victims."),
              h2("Comparing Scripts Written vs. Drugs Found in Overdoses in Connecticut"), width=200,
              fluidRow(
                box(
                  title = "Scripts Written in Connecticut", status = "primary", solidHeader = TRUE,width=600,
                  plotOutput("ct_scripts", height = 500, width = 800)
                )
              ),
              h3("Hydrocodone, oxycodone, and tramadol have the highest number of scripts written in CT. In theory, we'd expect to see a similar trend in the toxicity reports."),
              fluidRow(
                box(
                  title = "Frequency of Substances Detected in Accidental Overdose Deaths\nin Connecticut from 2012-2017", status = "primary", solidHeader = TRUE,width=600,
                  plotOutput("ct_ods", height = 600, width = 900)
                )
              ),
              h3('However, the most common opioids found in toxicity reports for accidental overdoses are heroin (which is not prescribed) and fentanyl. Although hydrocodone, oxycodone, and tramadol make up the majority of the opioid prescriptions, they do not have a significant presence in toxicity reports. ')
      ),
      # Second tab content
      tabItem(tabName = "scripts",
              h2("Script Analysis by Gender"),
              fluidPage(
                
                # Copy the chunk below to make a group of checkboxes
                checkboxGroupInput("checkGender", label = h3("Select the prescriber gender"), 
                                   choices = list("Female" = 1, "Male" = 2),
                                   selected = 1),
                
                
                hr(),
                fluidRow(column(3, verbatimTextOutput("value")))
                
              )
              
      ),
      # Second tab content
      tabItem(tabName = "sources",
              h3("''Cocaine Deaths Are Rising At An Alarming Rate, And It’s Because Of Fentanyl'' by Scott Pham and Dan Vergano"),
              url_article <- a("Article |", href="https://www.buzzfeednews.com/article/scottpham/cocaine-fentanyl-opioid-overdoses"),
              url_repo <- a("GitHub Repo", href="https://github.com/BuzzFeedNews/2018-05-fentanyl-and-cocaine-overdose-deaths")
              
      )
    )
  )
)
#