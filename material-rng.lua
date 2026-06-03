local bloc = script.Parent
local texte = bloc.SurfaceGui.SaleText

local touchable = true

local listeMateriaux = {
 {nom = "Terre", chance = 2, couleur = Color3.fromRGB(115, 74, 18)},
 {nom = "Bois", chance = 3, couleur = Color3.fromRGB(139, 69, 19)},
 {nom = "Pierre", chance = 5, couleur = Color3.fromRGB(128, 128, 128)},
 {nom = "Charbon", chance = 10, couleur = Color3.fromRGB(45, 45, 45)},
 {nom = "Cuivre", chance = 15, couleur = Color3.fromRGB(211, 130, 79)},
 {nom = "Fer", chance = 30, couleur = Color3.fromRGB(192, 192, 192)},
 {nom = "Or", chance = 100, couleur = Color3.fromRGB(255, 215, 0)},
 {nom = "Rubis", chance = 250, couleur = Color3.fromRGB(220, 20, 60)},
 {nom = "Émeraude", chance = 500, couleur = Color3.fromRGB(0, 200, 100)},
 {nom = "Diamant", chance = 1000, couleur = Color3.fromRGB(0, 255, 255)},
 {nom = "Obsidienne", chance = 2500, couleur = Color3.fromRGB(25, 20, 35)},
 {nom = "Platine", chance = 5000, couleur = Color3.fromRGB(220, 225, 230)},
 {nom = "Météorite", chance = 15000, couleur = Color3.fromRGB(100, 80, 110)},
 {nom = "Roche Lunaire", chance = 50000, couleur = Color3.fromRGB(230, 230, 250)},
 {nom = "Antimatière", chance = 100000, couleur = Color3.fromRGB(148, 0, 211)},
 {nom = "Étoile Neutronique", chance = 500000, couleur = Color3.fromRGB(240, 248, 255)},
 {nom = "Singularité", chance = 1000000, couleur = Color3.fromRGB(255, 69, 0)}
}

bloc.Touched:Connect(function(hit)
 if hit.Parent:FindFirstChild("Humanoid") and touchable == true then
  touchable = false
  
  for i = 1, 35 do
   local auPif = listeMateriaux[math.random(1, #listeMateriaux)]
   texte.Text = auPif.nom
   texte.TextColor3 = auPif.couleur
   wait(0.06)
  end
  
  local tirageRNG = math.random(1, 1000000)
  local materiauGagne = listeMateriaux[1]
  
  for _, mat in pairs(listeMateriaux) do
   if tirageRNG <= (1000000 / mat.chance) then
    materiauGagne = mat
   end
  end
  
  texte.Text = materiauGagne.nom .. " (1/" .. materiauGagne.chance .. ")"
  texte.TextColor3 = materiauGagne.couleur
  
  texte.TextSize = 55
  wait(0.1)
  texte.TextSize = 45
  
  wait(2.5)
  touchable = true
 end
end)
