print("Starting! \n")
print("Loading Love Engine \n")
local clockx = os.clock()
local clocks = 0

function love.load()
	
end

function love.update(dt)
    if dt > 0.035 then return end
    --for testing purposes. WARNING: this will print every time and it could be annoying
    --print("Ticking " .. string.format( "time: %.2f", os.clock() - clockx) .. " Return Tick \n")
end

function love.draw()
	
end