workspace "Life SH" "All the tools to empower your life in one place." {

    !identifiers hierarchical

    model {
        user = person "Utente"

        lifeSh = group "Life SH"{
            budgeting = softwareSystem "Budgeting System" "Gestione del budget personale" {
                budgetingDb = container "Budgeting Database" "Database per la gestione dei dati del budget" "PostgreSQL" "Database"
                budgetingDashboard = container "Dashboard Finanza" "Dashboard per la visualizzazione e gestione del budget" "Metabase" "Dashboard"
            }
            email = softwaresystem "E-mail System" "Gestore di posta elettronica" "Existing System"
            telegramBot = softwareSystem "Telegram Bot" "Permette all'utente di interfacciarsi con LifeSH"
            telegramUi = softwareSystem "Telegram App" "Interfaccia utente di Telegram" "Telegram Client"
        }

        email -> user "Invia e-mail a"
        budgeting -> email "Invia report e notifiche usando"
        user -> telegramUi "Esegue operazioni usando"
        telegramUi -> telegramBot "Interagisce con"

        budgeting.budgetingDashboard -> budgeting.budgetingDb "Mostra i dati usando"
        user -> budgeting.budgetingDashboard "Visualizza i dati del budget usando"
        telegramBot -> budgeting.budgetingDb "Inserisce nuove transazioni e setta budget in"
        

    }

    views {
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