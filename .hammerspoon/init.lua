hs.window.animationDuration = 0
local mod = {"ctrl", "alt"}

local function place(unit)
  return function()
    local win = hs.window.focusedWindow()
    if win then win:moveToUnit(unit) end
  end
end

-- Redimensionner (x, y, largeur, hauteur en fractions de l'écran)
hs.hotkey.bind(mod, "left",   place({0,   0,   0.5, 1}))
hs.hotkey.bind(mod, "right",  place({0.5, 0,   0.5, 1}))
hs.hotkey.bind(mod, "up",     place({0,   0,   1,   0.5}))
hs.hotkey.bind(mod, "down",   place({0,   0.5, 1,   0.5}))
hs.hotkey.bind(mod, "return", place({0,   0,   1,   1}))

-- Envoyer la fenêtre sur l'écran suivant / précédent
-- (elle garde sa taille et sa position relatives)
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "right", function()
  local win = hs.window.focusedWindow()
  if win then win:moveToScreen(win:screen():next(), false, true) end
end)
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "left", function()
  local win = hs.window.focusedWindow()
  if win then win:moveToScreen(win:screen():previous(), false, true) end
end)

hs.alert.show("Config Hammerspoon chargée")
