module Config where

import Prelude
import Data.Maybe (Maybe ())
import Data.Tuple (Tuple ())
import Data.StrMap (StrMap ())
import Data.Complex
import Control.Monad.Eff (Eff)
import Control.Monad.Except.Trans (ExceptT ())
import Graphics.WebGL.Types (WebGLProgram, WebGLTexture, WebGLFramebuffer, WebGLContext)
import Graphics.Canvas (Canvas)
import DOM (DOM)

type Epi eff a = ExceptT String (Eff (canvas :: Canvas, dom :: DOM | eff)) a

-- System
type SystemConf = {
    initEngineConf :: String
  , initUIConf :: String
  , initPattern :: String
}

type SystemST = {
    lastTimeMS :: Maybe Number
  , frameNum :: Int
  , lastFpsTimeMS :: Maybe Number
  , fps :: Maybe Int
  , systemConfLib :: StrMap SystemConf
  , uiConfLib :: StrMap UIConf
  , engineConfLib :: StrMap EngineConf
  , patternLib :: StrMap Pattern
  , moduleLib :: StrMap Module
  , shaderLib :: StrMap String
  , componentLib :: StrMap String
  , libraryLib :: StrMap String
}

-- Engine
type EngineConf = {
    kernelDim :: Int
  , fract :: Int
}

type EngineST = {
    displayProg :: WebGLProgram
  , mainProg :: WebGLProgram
  , tex :: (Tuple WebGLTexture WebGLTexture)
  , fb :: (Tuple WebGLFramebuffer WebGLFramebuffer)
  , ctx :: WebGLContext
}

-- UI
type UIConf = {
    canvasId :: String
  , consoleId :: String
  -- , showFps :: Boolean
}

-- Pattern
data SubModules = SubModules (StrMap Module) | SubModuleRef (StrMap String)

type Module = {
    component :: String
  , flags :: StrMap String
  , modules :: SubModules
  , par :: StrMap Number
  , zn :: Array Complex
  , images :: Array String
  , sub :: StrMap String
}

type Pattern = {
    flags :: StrMap String
  , modules :: SubModules
  , scripts :: Array String
  -- , 3d shit
  , t :: Number
  , tPhase :: Number
  , tSpd :: Number
}
