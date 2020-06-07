module Web.FrontController where
import IHP.RouterPrelude
import IHP.ControllerSupport
import Generated.Types
import Web.Types

-- Controller Imports
import IHP.Welcome.Controller

instance FrontController WebApplication where
    controllers = 
        [ startPage WelcomeAction
        -- Generator Marker
        ]

instance InitControllerContext WebApplication
