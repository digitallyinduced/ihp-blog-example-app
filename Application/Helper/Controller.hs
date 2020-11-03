module Application.Helper.Controller (
    -- To use the built in login:
    -- module IHP.LoginSupport.Helper.Controller
) where

-- Here you can add functions which are available in all your controllers

import IHP.LoginSupport.Helper.Controller
import Generated.Types

type instance CurrentUserRecord = User