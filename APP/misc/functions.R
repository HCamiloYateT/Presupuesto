
InputDinero <- function(id, label, value, dec = 0, max = NULL, min = NULL){
  
  res <- fluidRow(
    column(6, FormatearTexto(label, tamano_pct = 0.8)),
    column(6, autonumericInput(id, label = NULL, value = value, 
                               maximumValue = max, minimumValue = min,
                               currencySymbol = "$", width = "100%",
                               decimalPlaces = dec,
                               style = "height: 25px !important; font-size: 14px;"
    ))
  )
  return(res)
  
}
InputPorcentaje <- function(id, label, value){
  
  res <- fluidRow(
    column(6, FormatearTexto(label, tamano_pct = 0.8)),
    column(6, autonumericInput(id, label = NULL, value = value, 
                               max = 100, min = 0, decimalPlaces = 2,
                               currencySymbolPlacement = "s",
                               currencySymbol = "%", width = "100%",
                               style = "height: 25px !important; font-size: 14px;"
    ))
  )
  return(res)
  
}
InputNumero <- function(id, label, value, dec = 2, max = NULL, min = NULL){
  
  res <- fluidRow(
    column(6, FormatearTexto(label, tamano_pct = 0.8)),
    column(6, autonumericInput(id, label = NULL, value = value, 
                               maximumValue = max, minimumValue = min,
                               decimalPlaces = dec,
                               width = "100%",
                               style = "height: 25px !important; font-size: 14px;"
    ))
  )
  return(res)
  
}
