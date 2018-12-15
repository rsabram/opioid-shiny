shinyServer(function(input, output) {
  
  output$drugbars <- renderPlot({
    
    # create plot from filtered data
    state_count_opioids %>% 
      filter(State == input$state) %>% 
      ggplot(
        aes(x = drug, y = script_count_state)
      ) +
      geom_bar(
        stat = "identity", color = 'skyblue1', fill = 'skyblue2'
      ) +
      labs(y = 'Number of Prescriptions Written', x  = element_blank()) + 
      coord_flip() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position = 'none', axis.title.x = element_blank()) 
    
  })
  
  output$ct_ods <- renderPlot({
    ods_by_drug %>% 
      ggplot(
        aes(x= drug, y = count, fill = opioid)
      ) +
      geom_bar(width = 1, size = 1, color = "white", stat = "identity") +
      theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
      coord_flip() +
      labs(y = 'Frequency',  x  = element_blank())
  })
  
  output$ct_scripts <- renderPlot( {
    state_count_opioids %>% 
      filter(State == 'CT') %>% 
      ggplot(
        aes(x = drug, y = script_count_state)
      ) +
      geom_bar(
        stat = "identity",color = 'skyblue1', fill = 'skyblue2'
      ) +
      coord_flip() +
      labs(y = 'Number of Prescriptions Written',  x  = element_blank()) + 
      theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position = 'none', axis.title.x = element_blank())
  })

  output$genderbars <- renderPlot({
    reshape %>%
      filter(outcome %in% input$checkGender) %>% 
      ggplot(
        aes(x = drug, y = value, group=outcome, fill = outcome)
      ) +
      geom_bar(
        stat = "identity",
        position = position_dodge()
      )  +
      coord_flip() +
      labs(x = element_blank(), y = 'Scripts Written Per Prescriber')  +
      theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
      scale_fill_discrete(name = "Gender", breaks=c("spp_female", "spp_male"),
                          labels=c("Female", "Male"))
  
  })
})