dashboardPage(
  dashboardHeader(title = "Opioid Analysis"),
  dashboardSidebar(
    sidebarMenu(
      h5('by Rachael Abram', align = 'center'),
      br(),
      menuItem("State by State Analysis", tabName = "states", icon = icon("map-marked-alt")),
      menuItem("Connecticut", tabName = "ct", icon = icon("map-marker-alt")),
      menuItem("Script Analysis by Gender", tabName = "scripts", icon = icon("prescription")),
      menuItem("Further Reading", tabName = "sources", icon = icon("book-open")),
      menuItem("Data Sources", tabName = "kaggle", icon = icon("database"))
    )),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "states",
              title = "State", status = "primary", solidHeader = TRUE, width=3,
              h3("Select a state to see total opioids prescribed in 2014"),
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
      # Third tab content
      tabItem(tabName = "scripts",
              h2("Script Analysis by Gender"),
              h4("In looking for trends in the data, we wanted to see what percentage of opioids scripts were written split by gender of the prescribers."),
              fluidPage(
                # Copy the chunk below to make a group of checkboxes
                checkboxGroupInput("checkGender", label = h3("Select the prescriber gender"), 
                                   choices = list("Female" = "spp_female", "Male" = "spp_male"),
                                   selected = "spp_female"),
                
                
                hr(),
                fluidRow(
                  box(column(3, verbatimTextOutput("value")),title = "Average Scripts Written Per Provider", status = "primary", solidHeader = TRUE,width=600,
                         plotOutput("genderbars", height = 400, width = 800))),
                h3('For every opioid we analyzed, the average number of presciptions written per prescriber was higher for men than for women.')
                
              )
              
      ),
      # Second tab content
      tabItem(tabName = "sources",
              h3("''States Show the Way on the Opioid Epidemic'' by The New York Times Editorial Board"),
              h4(em("The Trump administration ought to take a page from the areas of the country where opioid deaths are decreasing.

")),
              nyt_url <- a("Article", href = "https://www.nytimes.com/2018/08/24/opinion/opioid-epidemic-states.html", target="_blank"),
              h3("''Cocaine Deaths Are Rising At An Alarming Rate, And It’s Because Of Fentanyl'' by Scott Pham and Dan Vergano"),
              h4(em("Cocaine deaths rose 52% between 2015 and 2016. A BuzzFeed News analysis shows the role of fentanyl in this staggering trend.")),
              url_article <- a("Article |", href="https://www.buzzfeednews.com/article/scottpham/cocaine-fentanyl-opioid-overdoses", target="_blank"),
              url_repo <- a("GitHub Repo", href="https://github.com/BuzzFeedNews/2018-05-fentanyl-and-cocaine-overdose-deaths", target="_blank"),
              h3("''Unintended Consequences'' by Terrence McCoy"),
              h4(em("Inside the fallout of America’s crackdown on opioids")),
              wapo_url <- a("Article", href = "https://www.washingtonpost.com/graphics/2018/local/impact-of-americas-opioid-crackdown/?utm_term=.88f8bc2c2f6b", target = "_blank"),
              br(),
              br(),
              img(src = "opioids_by_the_numbers.png")
              
      ),
      #new tab
      tabItem(tabName = "kaggle",
              h3('U.S. Opiate Prescriptions/Overdoses'),
             kaggle_url <- a('Kaggle', href= "https://www.kaggle.com/apryor6/us-opiate-prescriptions", target = "_blank"),
            h3('Accidental Drug Related Deaths 2012-2017'),
          ct_url <-a('Data.Gov', href="https://catalog.data.gov/dataset/accidental-drug-related-deaths-january-2012-sept-2015", target = "_blank")
    )
    )
  )
)
#