--[[ module usage - send string any kind like:
ACF, #ACF, AAAA, #ACDF, FFDDAA, #FFDDAA, #FFDDAA88
If you send 3 or 6 symbols color it returns 3 values OpenGL Color - r,g,b
If you send 4 or 8 symbols color it returns 4 values OpenGL Color - r,g,b,a
--]]
return function( colorString )
  -- to upper all symbols
  colorString = colorString:upper()
  --check start symbol - # or 0-9A-F
  local startSymbol = "#"
  local startSymbolExist = colorString:find(startSymbol) or 0
  if startSymbolExist > 1 then
    error("symbol # in wrong position")
  end
  if startSymbolExist == 0 then
    colorString = startSymbol .. colorString
  end
  if #colorString < 4 then
    error("string too short")
  end
  
  if #colorString >= 4 and #colorString <= 5 then
    local newString = startSymbol
    for letter = 2, #colorString do
      newString = newString .. colorString:sub(letter, letter):rep(2)
    end
    colorString = newString
  end
    
  local r = tonumber( string.sub(colorString, 2, 3), 16 )/255
  local g = tonumber( string.sub(colorString, 4, 5), 16 )/255
  local b = tonumber( string.sub(colorString, 6, 7), 16 )/255
  if #colorString == 9 then
    local a = tonumber( string.sub(colorString, 8, 9), 16 )/255
    return r,g,b,a
  end
  return r,g,b
end