workspace "Life SH" "All the tools to empower your life in one place." {

    !identifiers hierarchical

    model {
        user = person "Utente"


        lifeSh = group "Life SH"{
            budgeting = softwareSystem "Budgeting" "Gestione della parte finanziaria di LifeSH"{
                budDb = container "Budgeting Database" "Database per la gestione dei dati di budgeting e delle spese" "PostgreSQL" "Database"
                budDashboard = container "Budgeting Dashboard" "Dashboard per la visualizzazione dei dati delle spese e del budget" 
                budReportingEngine = container "Budgeting Reporting Engine" "Motore di reportistica per generare report e analisi sui dati di budgeting" "Python Flask" "Component"
                budMcp = container "Budgeting MCP" "Server MCP per la gestione delle interazioni con il modello LLM" "Python MCP SDK" "Component"
            }
            userInteractionController = softwareSystem "Interaction Controller" "Gestione delle varie interazioni dell'utente"{
                telegramBot = container "Telegram Bot" "Gestore delle interazioni con l'utente tramite Telegram" "Python Telegram Bot SDK" "Telegram Bot"
                llm = container "LLM" "Modello LLM per l'elaborazione del linguaggio naturale" "SmolLM1.7B" "Component"
            }
            email = softwaresystem "E-mail System" "Gestore di posta elettronica" "Existing System"
            telegramUi = softwareSystem "Telegram App" "Interfaccia utente di Telegram" "Telegram Client"
        }

        email -> user "Invia e-mail a"
        user -> telegramUi "Esegue operazioni usando"

        user -> budgeting.budDashboard "Visualizza dashboard di budgeting usando"
        budgeting.budDashboard -> budgeting.budDb "Legge i dati di budgeting da"
        budgeting.budDashboard -> budgeting.budDb "Scrive e legge i dati di Metabase da"
        budgeting.budReportingEngine -> budgeting.budDb "Legge i dati di budgeting da"
        budgeting.budReportingEngine -> email "Invia report via e-mail usando"
        budgeting.budMcp -> budgeting.budDb "Scrive i dati su e legge i dati da"

    }

    views {
        systemlandscape "SystemLandscape" {
            include *
            autoLayout
        }

        styles {
            element "Person" {
                color #ffffff
                fontSize 22
                shape Person
                background #08427b
            }
            element "Bank Staff" {
                background #999999
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Existing System" {
                background #999999
                color #ffffff
            }
            element "Telegram Client" {
                background #999999
                color #ffffff
                shape MobileDevicePortrait
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Web Browser" {
                shape WebBrowser
            }
            element "Dashboard" {
                shape WebBrowser
            }
            element "Telegram Bot" {
                shape MobileDevicePortrait
            }
            element "Database" {
                shape Cylinder
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
        }
    }

    // configuration {
    //     scope softwaresystem
    // }

}