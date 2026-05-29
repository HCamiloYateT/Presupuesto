# mod_parametros.R
# Módulo Shiny: Panel de Parámetros Presupuestales
# Encapsula todos los inputs macroeconómicos, factores productivos
# y precios de venta requeridos para el cálculo presupuestal 2027.
# Expone un reactivo consolidado y un evento de guardado al módulo padre.
#
# Uso en UI padre:
#   parametrosUI("params")
#
# Uso en Server padre:
#   mod_par <- parametrosServer("params")
#   observeEvent(mod_par$guardar(), { ... })
#   params <- mod_par$params          # reactivo con lista completa
#   params_ok <- mod_par$params_guardados  # solo tras confirmar guardado

library(shiny)
library(racafeShiny)
library(lubridate)


# Constantes  ----
.PAR_AUDITORIA_INICIAL <- list(
  fecha   = as.POSIXct("2025-09-01 00:00:00", tz = "America/Bogota"),
  usuario = "hcyate"
)

"#C0392B"

# Helpers ----
.pie_auditoria <- function(info) {
  fecha_fmt <- format(info$fecha, "%d de %B de %Y · %H:%M", locale = "es_CO")
  
  tags$div(
    style = paste(
      "margin-top: 14px;",
      "padding: 8px 10px;",
      "background-color: #f4f6f8;",
      "border-left: 3px solid #C0392B;",
      "border-radius: 3px;",
      "font-size: 0.78em;",
      "color: #5a6370;",
      "line-height: 1.5;"
    ),
    tags$span(
      style = "display: flex; align-items: center; gap: 6px;",
      shiny::icon("clock-rotate-left", style = "color: #C0392B; font-size: 0.95em;"),
      tags$span(
        tags$strong("Último almacenamiento: "),
        fecha_fmt,
        tags$span(
          style = "margin-left: 6px; color: #C0392B; font-weight: 600;",
          paste0("@", info$usuario)
        )
      )
    )
  )
}

.PAR_DEFAULTS <- list(
  SMLM          = 1550000,
  SubTransporte = 178200,
  CosRacafeAG   = 2.8,
  IPC_PPTO      = 5.1,
  IPC_SMLV      = 10.00,
  IPP           = 6.00,
  Factor        = 96.89,
  PctPasilla    = 4,
  PctConsumo    = 3.5,
  PctRipio      = 0.5,
  TRM_VIG       = 4080,
  TRM           = 4050,
  PrCarga       = 1204070.6643135,
  # Trilladoras
  PrExcelsoC    = 1017250.9434673,
  Pasilla       = 494950.796411677,
  ExcelsoD      = 1132982.85877845,
  Consumo       = 754318.78995988,
  Ripio         = 140000,
  AlaMedida     = 1226014.00152848,
  # Arenales
  ConsumoAre    = 785747.825735244,
  PasSolAre     = 542561.47514366,
  PasMolAre     = 618452.908625363
)


# UI ----

#' UI del módulo de parámetros presupuestales
#'
#' Genera el panel de inputs con namespace propio. Se puede incrustar
#' directamente en un `controlbarItem`, `tabPanel`, `bs4TabItem` o
#' cualquier contenedor de la app padre.
#'
#' @param id `character`. ID del módulo — debe coincidir con el usado
#'   en `parametrosServer()`.
#' @param defaults Lista nombrada con valores iniciales de los inputs.
#'   Por defecto usa `.PAR_DEFAULTS` definido en este mismo archivo.
#'
#' @return `tagList` con todos los inputs organizados por sección.
#' @export
parametrosUI <- function(id, defaults = .PAR_DEFAULTS) {
  
  ns <- NS(id)
  
  # Etiquetas TRM con año dinámico
  anio_vig  <- year(Sys.Date())
  anio_ppto <- anio_vig + 1L
  
  tagList(
    
    # Sección: Indicadores macroeconómicos ----
    fluidRow(
      column(6,
             InputDinero(ns("PAR_SMLM"), "Salario Mínimo",
                         defaults$SMLM),
             InputDinero(ns("PAR_SubTransporte"), "Subsidio de Transporte",
                         defaults$SubTransporte),
             InputDinero(ns("PAR_CosRacafeAG"), "Costos Racafé AG",
                         defaults$CosRacafeAG, dec = 2)
      ),
      column(6,
             InputPorcentaje(ns("PAR_IPC_PPTO"), "IPC Proyectado Ppto.",
                             defaults$IPC_PPTO),
             InputPorcentaje(ns("PAR_IPC_SMLV"), "IPC Proyectado SMLV",
                             defaults$IPC_SMLV),
             InputPorcentaje(ns("PAR_IPP"), "IPP Proyectado",
                             defaults$IPP)
      )
    ),
    
    tags$hr(style = "border-color: grey;"),
    
    # Sección: Factor estándar y mermas ----
    InputNumero(ns("PAR_Factor"), "Factor Estándar", defaults$Factor),
    fluidRow(
      column(4,
             InputPorcentaje(ns("PAR_PctPasilla"), "% Pasilla",
                             defaults$PctPasilla)
      ),
      column(4,
             InputPorcentaje(ns("PAR_PctConsumo"), "% Consumo",
                             defaults$PctConsumo)
      ),
      column(4,
             InputPorcentaje(ns("PAR_PctRipio"), "% Ripio",
                             defaults$PctRipio)
      )
    ),
    
    tags$hr(style = "border-color: grey;"),
    
    # Sección: Tasa de cambio ----
    InputDinero(ns("PAR_TRM_VIG"), paste("TRM", anio_vig),
                defaults$TRM_VIG),
    InputDinero(ns("PAR_TRM"), paste("TRM", anio_ppto),
                defaults$TRM),
    
    tags$hr(style = "border-color: grey;"),
    
    # Sección: Precio de carga ----
    InputDinero(ns("PAR_PrCarga"), "Precio Carga (125 Kls)",
                defaults$PrCarga),
    
    # Sección: Precios Trilladoras ----
    FormatearTexto("Precios de Venta Trilladoras", tamano_pct = 1.2),
    Saltos(2),
    fluidRow(
      column(6,
             InputDinero(ns("PAR_PrExcelsoC"), "Excelso Conv. (70 Kls)",
                         defaults$PrExcelsoC),
             InputDinero(ns("PAR_Pasilla"), "Pasilla (70 Kls)",
                         defaults$Pasilla),
             InputDinero(ns("PAR_ExcelsoD"), "Excelso Dif. (70 Kls)",
                         defaults$ExcelsoD)
      ),
      column(6,
             InputDinero(ns("PAR_Consumo"), "Consumo (70 Kls)",
                         defaults$Consumo),
             InputDinero(ns("PAR_Ripio"), "Ripio (70 Kls)",
                         defaults$Ripio),
             InputDinero(ns("PAR_AlaMedida"), "A la Medida (70 Kls)",
                         defaults$AlaMedida)
      )
    ),
    
    # Sección: Precios Arenales ----
    FormatearTexto("Precios de Venta Arenales", tamano_pct = 1.2),
    Saltos(2),
    fluidRow(
      column(6,
             InputDinero(ns("PAR_ConsumoAre"), "Consumo (70 Kls)",
                         defaults$ConsumoAre),
             InputDinero(ns("PAR_PasSolAre"), "Solubles (70 Kls)",
                         defaults$PasSolAre)
      ),
      column(6,
             InputDinero(ns("PAR_PasMolAre"), "Molidos (70 Kls)",
                         defaults$PasMolAre)
      )
    ),
    
    # Acción: guardar parámetros ----
    racafeShiny::Boton(ns("PAR_Guardar")),
    
    # Pie: trazabilidad de último almacenamiento ----
    # Se actualiza desde el server cada vez que el usuario guarda.
    uiOutput(ns("pie_auditoria"))
  )
}


# Server ----

#' Server del módulo de parámetros presupuestales
#'
#' Gestiona la reactividad de todos los inputs del panel de parámetros.
#' Expone dos reactivos y un evento al módulo padre para separar
#' el estado "en edición" del estado "confirmado".
#'
#' @param id `character`. ID del módulo — debe coincidir con el usado
#'   en `parametrosUI()`.
#' @param usuario `character`. Nombre o código del usuario activo en sesión.
#'   Se registra junto a la fecha cada vez que se presiona Guardar.
#'   Por defecto usa `.PAR_AUDITORIA_INICIAL$usuario` (dato de referencia).
#'
#' @return Lista nombrada con tres elementos reactivos:
#'   - `params`: reactivo que refleja el estado actual de los inputs
#'     (se actualiza en tiempo real con cada cambio del usuario).
#'   - `params_guardados`: reactivo que solo se actualiza al presionar
#'     "Guardar" — úsalo para disparar cálculos costosos.
#'   - `guardar`: reactivo del evento del botón Guardar (conteo de clics).
#'   - `auditoria`: reactivo con lista `$fecha` y `$usuario` del último guardado.
#' @export
parametrosServer <- function(id, usuario = .PAR_AUDITORIA_INICIAL$usuario) {
  
  moduleServer(id, function(input, output, session) {
    
    # Estado de auditoría: fecha y usuario del último guardado ----
    # Se inicializa con datos de referencia. Al presionar Guardar se
    # reemplaza con Sys.time() y el usuario de sesión recibido como argumento.
    rv_auditoria <- reactiveVal(.PAR_AUDITORIA_INICIAL)
    
    # Reactivo: estado en tiempo real de todos los parámetros ----
    # Se actualiza con cada tecla/click en cualquier input del panel.
    # Útil para validaciones o previsualizaciones en vivo.
    params <- reactive({
      list(
        # Macroeconómicos
        SMLM          = input$PAR_SMLM,
        SubTransporte = input$PAR_SubTransporte,
        CosRacafeAG   = input$PAR_CosRacafeAG,
        IPC_PPTO      = input$PAR_IPC_PPTO,
        IPC_SMLV      = input$PAR_IPC_SMLV,
        IPP           = input$PAR_IPP,
        # Factor y mermas
        Factor        = input$PAR_Factor,
        PctPasilla    = input$PAR_PctPasilla,
        PctConsumo    = input$PAR_PctConsumo,
        PctRipio      = input$PAR_PctRipio,
        # TRM
        TRM_VIG       = input$PAR_TRM_VIG,
        TRM           = input$PAR_TRM,
        # Carga
        PrCarga       = input$PAR_PrCarga,
        # Precios Trilladoras
        PrExcelsoC    = input$PAR_PrExcelsoC,
        Pasilla       = input$PAR_Pasilla,
        ExcelsoD      = input$PAR_ExcelsoD,
        Consumo       = input$PAR_Consumo,
        Ripio         = input$PAR_Ripio,
        AlaMedida     = input$PAR_AlaMedida,
        # Precios Arenales
        ConsumoAre    = input$PAR_ConsumoAre,
        PasSolAre     = input$PAR_PasSolAre,
        PasMolAre     = input$PAR_PasMolAre
      )
    })
    
    # Reactivo: instantánea de parámetros al momento de guardar ----
    # Solo se recalcula cuando el usuario presiona el botón Guardar.
    # Los módulos de cálculo costoso deben depender de este reactivo,
    # no de `params`, para evitar recomputaciones innecesarias.
    params_guardados <- eventReactive(
      input$PAR_Guardar,
      {
        params()
      },
      ignoreNULL  = TRUE,
      ignoreInit  = TRUE
    )
    
    # Actualizar auditoría al guardar ----
    # Registra timestamp exacto del clic y el usuario de sesión.
    observeEvent(input$PAR_Guardar, {
      rv_auditoria(list(
        fecha   = Sys.time(),
        usuario = usuario
      ))
    }, ignoreNULL = TRUE, ignoreInit = TRUE)
    
    # Render: pie de trazabilidad ----
    # Reconstruye el HTML del footer cada vez que cambia rv_auditoria.
    output$pie_auditoria <- renderUI({
      .pie_auditoria(rv_auditoria())
    })
    
    # Retorno: interfaz pública del módulo ----
    list(
      params           = params,
      params_guardados = params_guardados,
      guardar          = reactive(input$PAR_Guardar),
      auditoria        = reactive(rv_auditoria())
    )
  })
}