InfoPptoUI <- function(id) {
  ns <- shiny::NS(id)
  
  # Modulos por seccion (segun sidebar) ----
  modulos <- list(
    list(seccion = "Presupuestos",         icon = "file-alt",   color = "#dc3545",
         items = c("A la Medida","Analítica","Casas Vacacionales","Calidad",
                   "Contabilidad","Convencionales","Coproductos","Control Interno",
                   "Diferenciados","Equipo de Campo","Mant. Oficina Principal",
                   "Mant. Trilladoras","Operaciones","Seguros","Sistemas",
                   "SST / Gestión Ambiental","Talento Humano")),
    list(seccion = "Trilladoras",          icon = "industry",   color = "#dc3545",
         items = c("Producción","Costos Variables","Costos Fijos","Puntos de Compra")),
    list(seccion = "Gastos Of. Principal", icon = "landmark",   color = "#dc3545",
         items = c("Personal","Ejecución","Proyectado","Presupuesto","Informes")),
    list(seccion = "Margen Neto FCC",      icon = "chart-line", color = "#dc3545",
         items = c("Producción País","Sacos","Depreciación","Presupuesto por Saco")),
    list(seccion = "Administración",       icon = "cogs",       color = "#dc3545",
         items = c("Usuarios","Permisos","Logs"))
  )
  
  shiny::tagList(
    shiny::fluidPage(
      
      # Encabezado ----
      shiny::tags$div(
        style = paste0("background:linear-gradient(135deg,#dc3545,#c82333);",
                       "color:white;border-radius:8px;padding:24px 32px;margin-bottom:24px;"),
        shiny::h2(icon("chart-pie", style = "margin-right:10px;"),
                  paste("Presupuesto", año_ppto),
                  style = "margin:0 0 6px 0; font-weight:700; color:white;"),
        shiny::p(paste0("Aplicación corporativa para la elaboración, revisión y gestión ",
                        "del presupuesto correspondiente al año ", año_ppto, ". ",
                        "Integra datos históricos desde 2016 y proyecciones con modelos de series de tiempo."),
                 style = "margin:0; font-size:14px; opacity:0.9;")
      ),
      
      # Instrucciones ----
      shiny::fluidRow(
        shiny::column(6,
                      bs4Dash::bs4Card(width = 12, status = "white", solidHeader = FALSE, collapsible = FALSE,
                                       title = tagList(icon("keyboard"), " Ingreso de datos"),
                                       shiny::tags$ul(style = "font-size:13px; line-height:1.9;",
                                                      shiny::tags$li(shiny::strong("Celdas azules:"),         " Campos editables. Ingrese únicamente en estas áreas."),
                                                      shiny::tags$li(shiny::strong("Celdas grises/blancas:"), " Ejecuciones históricas o cálculos automáticos. Solo lectura.")
                                       )
                      )
        ),
        shiny::column(6,
                      bs4Dash::bs4Card(width = 12, status = "white", solidHeader = FALSE, collapsible = FALSE,
                                       title = tagList(icon("mouse-pointer"), " Funcionalidad de botones"),
                                       shiny::tags$ul(style = "font-size:13px; line-height:1.9;",
                                                      shiny::tags$li(shiny::strong("Añadir:"),    " Incorpora nuevas filas."),
                                                      shiny::tags$li(shiny::strong("Revertir:"),  " Deshace cambios no guardados."),
                                                      shiny::tags$li(shiny::strong("Guardar:"),   " Persiste los datos en base de datos."),
                                                      shiny::tags$li(shiny::strong("Detalle:"),   " Despliega desglose del ítem seleccionado."),
                                                      shiny::tags$li(shiny::strong("Confirmar:"), " Valida y finaliza la captura del módulo.")
                                       )
                      )
        )
      ),
      
      # Capacidades de la aplicacion ----
      shiny::fluidRow(
        shiny::column(12,
                      bs4Dash::bs4Card(width = 12, status = "white", solidHeader = FALSE,
                                       collapsible = FALSE,
                                       title = tagList(icon("lightbulb"), " ¿Qué puede hacer esta aplicación?"),
                                       shiny::tags$div(style = "display:flex; flex-wrap:wrap; gap:12px;",
                                                       
                                                       # Acceso segmentado ----
                                                       shiny::tags$div(
                                                         style = "flex:1; min-width:220px; background:#fff; border-left:4px solid #dc3545; border-radius:6px; padding:14px; box-shadow:0 1px 4px rgba(0,0,0,.08);",
                                                         shiny::tags$div(style = "font-weight:700; font-size:13px; color:#dc3545; margin-bottom:6px;",
                                                                         icon("lock", style = "margin-right:6px;"), "Acceso por área"
                                                         ),
                                                         shiny::tags$p(style = "font-size:12px; margin:0; color:#555;",
                                                                       "Cada usuario visualiza únicamente los módulos habilitados para su área o rol. ",
                                                                       "El acceso es gestionado por el administrador de la aplicación."
                                                         )
                                                       ),
                                                       
                                                       # Modelos de pronostico ----
                                                       shiny::tags$div(
                                                         style = "flex:1; min-width:220px; background:#fff; border-left:4px solid #dc3545; border-radius:6px; padding:14px; box-shadow:0 1px 4px rgba(0,0,0,.08);",
                                                         shiny::tags$div(style = "font-weight:700; font-size:13px; color:#dc3545; margin-bottom:6px;",
                                                                         icon("brain", style = "margin-right:6px;"), "Modelos de pronóstico"
                                                         ),
                                                         shiny::tags$p(style = "font-size:12px; margin:0; color:#555;",
                                                                       "La aplicación incorpora modelos de series de tiempo entrenados con datos desde 2016. ",
                                                                       "Estos pronósticos sirven como referencia y apoyo a la toma de decisiones en la elaboración del presupuesto."
                                                         )
                                                       ),
                                                       
                                                       # Conceptos flexibles ----
                                                       shiny::tags$div(
                                                         style = "flex:1; min-width:220px; background:#fff; border-left:4px solid #dc3545; border-radius:6px; padding:14px; box-shadow:0 1px 4px rgba(0,0,0,.08);",
                                                         shiny::tags$div(style = "font-weight:700; font-size:13px; color:#dc3545; margin-bottom:6px;",
                                                                         icon("plus-circle", style = "margin-right:6px;"), "Conceptos flexibles"
                                                         ),
                                                         shiny::tags$p(style = "font-size:12px; margin:0; color:#555;",
                                                                       "Además de los conceptos predefinidos por área, cada módulo permite añadir nuevas filas ",
                                                                       "para registrar conceptos adicionales que no estaban contemplados inicialmente."
                                                         )
                                                       ),
                                                       
                                                       # Historico integrado ----
                                                       shiny::tags$div(
                                                         style = "flex:1; min-width:220px; background:#fff; border-left:4px solid #dc3545; border-radius:6px; padding:14px; box-shadow:0 1px 4px rgba(0,0,0,.08);",
                                                         shiny::tags$div(style = "font-weight:700; font-size:13px; color:#dc3545; margin-bottom:6px;",
                                                                         icon("history", style = "margin-right:6px;"), "Histórico integrado"
                                                         ),
                                                         shiny::tags$p(style = "font-size:12px; margin:0; color:#555;",
                                                                       "Cada módulo muestra las ejecuciones históricas de años anteriores como contexto, ",
                                                                       "facilitando la comparación y el análisis de tendencias al momento de presupuestar."
                                                         )
                                                       )
                                       )
                      )
        )
      ),
      
      # Soporte ----
      shiny::fluidRow(
        shiny::column(12,
                      bs4Dash::bs4Card(width = 12, status = "white", solidHeader = FALSE, collapsible = FALSE,
                                       title = tagList(icon("envelope"), " Soporte y contacto"),
                                       shiny::tags$p("Para consultas, dudas o requerimientos contacte al equipo:",
                                                     style = "font-size:13px; margin-bottom:8px;"),
                                       shiny::tags$div(style = "display:flex; gap:12px; flex-wrap:wrap;",
                                                       lapply(c("hcyate@racafe.com", "cmfranco@racafe.com"), function(email) {
                                                         shiny::tags$a(href = paste0("mailto:", email), email,
                                                                       class = "badge badge-danger",
                                                                       style = "font-size:12px; padding:5px 10px; text-decoration:none;")
                                                       })
                                       )
                      )
        )
      )
    )
  )
}

InfoPpto <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {})
}