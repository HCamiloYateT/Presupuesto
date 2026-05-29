body <- bs4DashBody(
  includeCSS("https://raw.githubusercontent.com/HCamiloYateT/Compartido/refs/heads/main/Styles/style.css"),
  use_waiter(),
  useShinyjs(),
  bs4TabItems(
    # Landing ----
    bs4TabItem(tabName = "Landing", InfoPptoUI("info")),
    # Presupuestos ----
    bs4TabItem(tabName = "PLA_a_la_medida", h2("Presupuesto - A la Medida")),
    bs4TabItem(tabName = "PLA_analitica", h2("Presupuesto - Analítica")),
    bs4TabItem(tabName = "PLA_casas_vacacionales",  h2("Presupuesto - Casas Vacacionales")),
    bs4TabItem(tabName = "PLA_calidad_inocuidad", h2("Presupuesto - Calidad")),
    bs4TabItem(tabName = "PLA_contabilidad",h2("Presupuesto - Contabilidad")),
    bs4TabItem(tabName = "PLA_convencionales", h2("Presupuesto - Convencionales")),
    bs4TabItem(tabName = "PLA_coproductos", h2("Presupuesto - Coproductos")),
    bs4TabItem(tabName = "PLA_control_interno", h2("Presupuesto - Control Interno")),
    bs4TabItem(tabName = "PLA_diferenciados", h2("Presupuesto - Diferenciados")),
    bs4TabItem(tabName = "PLA_equipo_campo",h2("Presupuesto - Equipo de Campo")),
    bs4TabItem(tabName = "PLA_mant_oficina",h2("Presupuesto - Mant. Oficina Principal")),
    bs4TabItem(tabName = "PLA_mant_trilladoras",  h2("Presupuesto - Mant. Trilladoras")),
    bs4TabItem(tabName = "PLA_operaciones", h2("Presupuesto - Operaciones")),
    bs4TabItem(tabName = "PLA_seguros", h2("Presupuesto - Seguros")),
    bs4TabItem(tabName = "PLA_sistemas", h2("Presupuesto - Sistemas")),
    bs4TabItem(tabName = "PLA_sst_ga", h2("Presupuesto - SST / Gestión Ambiental")),
    bs4TabItem(tabName = "PLA_th", h2("Presupuesto - Talento Humano")),
    # Trilladoras ----
    bs4TabItem(tabName = "TRI_Produccion", h2("Trilladoras - Producción")),
    bs4TabItem(tabName = "TRI_costos_variables", h2("Trilladoras - Costos Variables")),
    bs4TabItem(tabName = "TRI_costos_fijos", h2("Trilladoras - Costos Fijos")),
    bs4TabItem(tabName = "TRI_puntos_compra", h2("Trilladoras - Puntos de Compra")),
    # Gastos Of. Principal ----
    bs4TabItem(tabName = "GOF_Personal",  h2("Gastos Of. Principal - Personal")),
    bs4TabItem(tabName = "GOF_Ejecucion", h2("Gastos Of. Principal - Ejecución")),
    bs4TabItem(tabName = "GOF_Proyectado", h2("Gastos Of. Principal - Proyectado")),
    bs4TabItem(tabName = "GOF_Presupuesto", h2("Gastos Of. Principal - Presupuesto")),
    bs4TabItem(tabName = "GOF_Informes", h2("Gastos Of. Principal - Informes")),
    # Margen Neto FCC ----
    bs4TabItem(tabName = "MNF_produccion_pais", h2("Margen Neto FCC - Producción País")),
    bs4TabItem(tabName = "MNF_sacos", h2("Margen Neto FCC - Sacos")),
    bs4TabItem(tabName = "MNF_depreciacion",h2("Margen Neto FCC - Depreciación")),
    bs4TabItem(tabName = "MNF_ppto_saco", h2("Margen Neto FCC - Presupuesto por Saco")),
    # Administracion ----
    bs4TabItem(tabName = "ADM_usuarios", h2("Administración - Usuarios")),
    bs4TabItem(tabName = "ADM_permisos", h2("Administración - Permisos")),
    bs4TabItem(tabName = "ADM_control", h2("Control")),
    bs4TabItem(tabName = "ADM_logs", h2("Administración - Logs"))
    )
  )
