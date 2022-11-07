#' module_1_1 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#'
#' @import plotly
#'
#' @import DT
#'
#' @import shinydashboard
mod_module_1_1_ui <- function(id){
  ns <- NS(id)
  #shinydashboardPlus::box(class ="shinydashboardPlusbox",
  shinydashboardPlusbox_MF(
    title = h5('\u0639\u0646\u0648\u0627\u0646'
                       ,class ="h1t2"
    ),
    closable = TRUE,
    width = 12,
    height = "500px",
    solidHeader = FALSE,
    collapsible = TRUE,
    #actionButton("update", "Toggle card sidebar"),
    sidebar = shinydashboardPlus::boxSidebar(
      id = ns("mycardsidebar"),
      width = 25

      ,sliderInput(
        ns("settings_line_size"),
        "line size(plot):",
        min = 0,
        max = 10,
        value = 4,step =0.25
      ),
      sliderInput(
        ns("settings_marker_size"),
        "marker size(plot):",
        min = 1,
        max = 15,
        value = 4,step =0.25
      )
    )
    ,actionButton(ns('send_message'), 'Send a message')
    ,plotlyOutput(ns("plotly_Output"))
    , DTOutput(ns("dt_table"))

  )

}

#' module_1_1 Server Functions
#'
#' @noRd
mod_module_1_1_server <- function(id, notificationModule,messageModule,taskItemModule
                                  ){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    observeEvent(input$send_message, {
      notificationModule$push_notification(notificationItem(sprintf('Tab2: Pushed a notification at %s', Sys.time())))
      messageModule$push_message(messageItem(
        from="from admin"
        ,message=sprintf('Tab 1: Pushed a message at %s', Sys.time())

        ))
      taskItemModule$push_taskItem(
        taskItem(value = 90, color = "green", sprintf('Tab 1: Pushed a message at %s', Sys.time())
                 ))
    })
  })
}

## To be copied in the UI
# mod_module_1_1_ui("module_1_1_1")

## To be copied in the server
# mod_module_1_1_server("module_1_1_1")


