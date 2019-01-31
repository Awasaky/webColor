local webColor = require("webColor")

print(webColor("#BABF00"))
print(webColor("BABF00"))
print(webColor("BABF00DD"))
print(webColor("#BABF00DD"))

local rectangle = display.newRect(100, 100, 100, 100)
rectangle:setFillColor( webColor("#00FF00FF") )

local rectangle2 = display.newRect(100, 130, 100, 100)
rectangle2:setFillColor( webColor("FF00FFAA") )
rectangle2.x = 0
transition.to(rectangle2, {time=12000, x = 200, iterations = 0, transition=easing.continuousLoop})