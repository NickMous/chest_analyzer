local monitor = peripheral.find("monitor")
local chest = peripheral.find("minecraft:chest")
local width, height = monitor.getSize()

function printTable(t, indent)
    indent = indent or ''
    for key, value in pairs(t) do
        if type(value) == "table" then
            print(indent .. key .. ": ")
            printTable(value, indent .. '  ')
        else
            print(indent .. key .. ": " .. tostring(value))
        end
        -- io.read()
    end
end

print(chest.list())
printTable(chest.list())

while true do
    local amountItems = 0
    for i, item in pairs(chest.list()) do
        amountItems = amountItems + 1
    end
    monitor.clear()
    local text = "Chest contents:\n"
    local length = string.len(text)
    -- monitor.setCursorPos(math.floor((width - length) / 2), i + 1)
    monitor.setCursorPos(math.floor((width - length) / 2), math.floor(height / 3) - 1)
    monitor.setTextColour(colors.white)
    monitor.write("Chest contents:\n")
    for i, item in pairs(chest.list()) do
        local text = chest.getItemDetail(i).displayName
        local length = string.len(text)
        monitor.setCursorPos(math.floor((width - length) / 2), math.floor(height / 3) + i * 2 - 1)
        monitor.setTextColour(colors.white)
        monitor.write(text)
        text = item.count .. "x"
        length = string.len(text)
        monitor.setCursorPos(math.floor((width - length) / 2), math.floor(height / 3) + i * 2)
        monitor.setTextColour(colors.gray)
        monitor.write(text)
    end
    sleep(10)
end
