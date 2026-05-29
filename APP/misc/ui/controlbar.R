controlbar <- bs4DashControlbar(id = "controlbar", skin = "light", pinned = NULL, 
                                overlay = TRUE, width = "500px", type = "pills",
                                title = "Parámetros", 
                                controlbarMenu(id = "controlbarMenu", type = "tabs",
                                               controlbarItem("Parámetros", parametrosUI("params"))
                                               )
                                )