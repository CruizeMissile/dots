-- |

module Config.Projects where

import XMonad
import XMonad.Actions.DynamicProjects

import App.Alias

wsPlain   = "1" -- https://fontawesome.com/icons/circle?style=solid
wsTerm    = "2"
wsCode    = "3" -- https://fontawesome.com/icons/envelope?style=solid
wsWeb     = "4" -- https://fontawesome.com/icons/code?style=solid
wsMusic   = "5" -- https://fontawesome.com/icons/music?style=solid
wsMail    = "6" -- https://fontawesome.com/icons/terminal?style=solid
wsScratch = "7" -- https://fontawesome.com/icons/globe-europe?style=solid

wsList = [ wsScratch
         , wsTerm
         , wsWeb
         , wsCode
         , wsMusic
         , wsPlain
         , wsMail
         ]

projects :: [Project]
projects =
  [ Project { projectName      = wsPlain
            , projectDirectory = "~/"
            , projectStartHook = Just $ return ()
            }
  , Project { projectName      = wsTerm
            , projectDirectory = "~/"
            , projectStartHook = Just $ return () -- spawn tty
            }
  , Project { projectName      = wsCode
            , projectDirectory = "~/"
            , projectStartHook = Just $ return () -- spawn code
            }
  , Project { projectName      = wsWeb
            , projectDirectory = "~/"
            , projectStartHook = Just $ return () -- spawn browser
            }
  , Project { projectName      = wsMusic
            , projectDirectory = "~/"
            , projectStartHook = Just $ return () -- spawn music
            }
  , Project { projectName      = wsMail
            , projectDirectory = "~/"
            , projectStartHook = Just $ return ()
            }
  , Project { projectName      = wsScratch
            , projectDirectory = "~/"
            , projectStartHook = Just $ return ()
            }
  ]