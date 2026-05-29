sidebar <- bs4DashSidebar(status = "danger", expandOnHover = FALSE,
    bs4SidebarMenu(id = "menu_principal",
      # Landing ----
      bs4SidebarMenuItem("Información", tabName = "Landing", icon = icon("info-circle")),
      # Ingreso de Informacion ----
      bs4SidebarMenuItem("Presupuestos", icon = icon("file-alt"),
                         bs4SidebarMenuSubItem("A la Medida", tabName = " PLA_a_la_medida", icon = icon("puzzle-piece")),
                         bs4SidebarMenuSubItem("Analítica", tabName = " PLA_analitica",  icon = icon("chart-bar")),
                         bs4SidebarMenuSubItem("Casas Vacacionales", tabName = " PLA_casas_vacacionales",icon = icon("home")),
                         bs4SidebarMenuSubItem("Calidad", tabName = " PLA_calidad_inocuidad", icon = icon("check-circle")),
                         bs4SidebarMenuSubItem("Contabilidad", tabName = " PLA_contabilidad", icon = icon("calculator")),
                         bs4SidebarMenuSubItem("Convencionales", tabName = " PLA_convencionales", icon = icon("box")),
                         bs4SidebarMenuSubItem("Coproductos", tabName = " PLA_coproductos", icon = icon("boxes")),
                         bs4SidebarMenuSubItem("Control Interno", tabName = " PLA_control_interno", icon = icon("user-shield")),
                         bs4SidebarMenuSubItem("Diferenciados", tabName = " PLA_diferenciados", icon = icon("star")),
                         bs4SidebarMenuSubItem("Equipo de Campo", tabName = " PLA_equipo_campo", icon = icon("tractor")),
                         bs4SidebarMenuSubItem("Mant. Oficina Principal",tabName = " PLA_mant_oficina", icon = icon("building")),
                         bs4SidebarMenuSubItem("Mant. Trilladoras", tabName = " PLA_mant_trilladoras", icon = icon("tools")),
                         bs4SidebarMenuSubItem("Operaciones", tabName = " PLA_operaciones", icon = icon("ship")),
                         bs4SidebarMenuSubItem("Seguros", tabName = " PLA_seguros",  icon = icon("shield-alt")),
                         bs4SidebarMenuSubItem("Sistemas", tabName = " PLA_sistemas",  icon = icon("laptop-code")),
                         bs4SidebarMenuSubItem("SST / Gestión Ambiental", tabName = " PLA_sst_ga",  icon = icon("leaf")),
                         bs4SidebarMenuSubItem("Talento Humano", tabName = " PLA_th",  icon = icon("user-tie"))
                         ),
      bs4SidebarMenuItem("Trilladoras", icon = icon("industry"),
                         bs4SidebarMenuSubItem("Producción", tabName = "TRI_Produccion", icon = icon("industry")),
                         bs4SidebarMenuSubItem("Costos Variables", tabName = "TRI_costos_variables", icon = icon("chart-area")),
                         bs4SidebarMenuSubItem("Costos Fijos", tabName = "TRI_costos_fijos", icon = icon("file-invoice-dollar")),
                         bs4SidebarMenuSubItem("Puntos de Compra", tabName = "TRI_puntos_compra", icon = icon("map-marker-alt"))
                         ),
      bs4SidebarMenuItem("Gastos Of. Principal", icon = icon("landmark"),
                         bs4SidebarMenuSubItem("Personal", tabName = "GOF_Personal",  icon = icon("users")),
                         bs4SidebarMenuSubItem("Ejecución", tabName = "GOF_Ejecucion", icon = icon("chart-bar")),
                         bs4SidebarMenuSubItem("Proyectado", tabName = "GOF_Proyectado", icon = icon("chart-line")),
                         bs4SidebarMenuSubItem("Presupuesto", tabName = "GOF_Presupuesto", icon = icon("file-invoice-dollar")),
                         bs4SidebarMenuSubItem("Informes", tabName = "GOF_Informes", icon = icon("table"))
                         ),
      bs4SidebarMenuItem("Margen Neto FCC", icon = icon("chart-line"),
                         bs4SidebarMenuSubItem("Producción País", tabName = "MNF_produccion_pais", icon = icon("globe-americas")),
                         bs4SidebarMenuSubItem("Sacos", tabName = "MNF_sacos", icon = icon("box")),
                         bs4SidebarMenuSubItem("Depreciación", tabName = "MNF_depreciacion", icon = icon("arrow-down")),
                         bs4SidebarMenuSubItem("Presupuesto por Saco", tabName = "MNF_ppto_saco", icon = icon("file-invoice-dollar"))
                         ),
      bs4SidebarMenuItem("Administración", icon = icon("cogs"),
                         bs4SidebarMenuSubItem("Usuarios", tabName = "ADM_usuarios", icon = icon("users-cog")),
                         bs4SidebarMenuSubItem("Permisos", tabName = "ADM_permisos", icon = icon("lock")),
                         bs4SidebarMenuSubItem("Control", tabName = "ADM_control", icon = icon("clipboard-check")),
                         bs4SidebarMenuSubItem("Logs", tabName = "ADM_logs", icon = icon("clipboard-list"))
                         )
      )
)