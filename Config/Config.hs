module Config where

import IHP.Prelude
import IHP.Environment
import IHP.FrameworkConfig

instance FrameworkConfig where 
    environment = Development
    appHostname = "localhost"
