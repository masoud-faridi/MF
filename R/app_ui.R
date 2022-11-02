#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#'
#' @import shinydashboard
#'
#' @import shinydashboardPlus
#'
#' @noRd
app_ui <- function(request) {
  app_sys()

  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    ############################


    shinydashboardPlus::dashboardPage(

      header=
      ########################################################
      ########################################################
      shinydashboardPlus::dashboardHeader(
        #title =
    title = h1('\u0633\u0627\u0645\u0627\u0646\u0647 \u0647\u0648\u0634\u0645\u0646\u062f \u0633\u0627\u0639\u062f'
               ,class ="h1t"
               )
    # title = h1('\u0633\u0627\u0645\u0627\u0646\u0647 \u0647\u0648\u0634\u0645\u0646\u062f \u0633\u0627\u0639\u062f',
    #align="center", style="font-family: 'B Nazanin';font-size:5px;
    #               font-weight: normal;
    #               font-thickness: 100%;
    #               font-size: 100%;
    #               ")



        ,
        #htmltools::
        tags$li(class = "dropdown",
                #       htmltools::
                tags$a(href="https://www.cybersec.ir/", target="_blank",
                       #htmltools::
                       tags$img(height = "30px", alt="cybersec", src=
                                  #app_sys(
                                  "www/icon_1_fanavaran_2.png"
                                #)
                                #"D:/Projects/golembase/inst/app/www/icon_1_fanavaran_2.png"
                                #UI_global_menu_src1
                       )          )
        ),
        #htmltools::
        tags$li(class = "dropdown",
                #htmltools::
                tags$a(href="https://rahvar120.ir/", target="_blank",
                       #                  htmltools::
                       tags$img(height = "30px", alt="cybersec", src=  #app_sys(
                                  "www/icon_2_police.png")
                       #)
                )
        )


        ,notificationUI('notificationUI')
        ,messageUI('messageUI')
        ,taskItemUI('taskItemUI')

      )


      ########################################################
      ########################################################
      ,

      sidebar=
      ########################################################
      ########################################################
      shinydashboardPlus::dashboardSidebar(
        #id='dashboardSidebar',
        #collapsed = FALSE,
        div(htmlOutput("welcome"), style = "padding: 20px"),
        sidebarMenu(
          # menuItem database 1
          menuItem(ui_global_variable$mI_1_0$name ,icon = icon("search"),
                   menuSubItem(ui_global_variable$mI_1_1$name, tabName = ui_global_variable$mI_1_1$ID, icon = icon("fa-sharp fa-solid fa-file-csv"))


          )

        )



      )


      ########################################################
      ########################################################
      ,

      body=
      ########################################################
      ########################################################
      shinydashboard::dashboardBody(
        tags$head(

          tags$link(rel = "stylesheet", type = "text/css", href = "www/custom.css")

          ),


        tabItems(
          tabItem(tabName = ui_global_variable$mI_1_1$ID, mod_module_1_1_ui("module_1_1_1"))
        # menuItem_database
        # tabItem(tabName =  ui_global_variable$mI_1_1$ID, mf_modules_mI_1_1_uiOutput_db_searchDB_UI("mI_1_1_uiOutput_modules"))


      ))


      ########################################################
      ########################################################
      )

    ############################


  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "MF"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )




}
