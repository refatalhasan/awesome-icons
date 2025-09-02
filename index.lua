-- Welcome message
print("Welcome to the Lua Demo!")

-- Variables and types
local name = "Lua"
local version = 5.4
local isFun = true

print("Language: " .. name .. ", Version: " .. version .. ", Fun: " .. tostring(isFun))

-- Tables (arrays)
local numbers = {1, 2, 3, 4, 5}
print("Numbers:")
for i, v in ipairs(numbers) do
    print("  " .. v)
end

-- Tables (dictionaries)
local ages = {Alice = 30, Bob = 25}
print("Ages:")
for k, v in pairs(ages) do
    print("  " .. k .. ": " .. v)
end

-- Functions
local function greet(person)
    print("Hello, " .. person .. "!")
end
greet("Alice")

-- Looping
for i = 1, 5 do
    print("Loop " .. i)
end

-- Conditionals
local x = 10
if x > 5 then
    print(x .. " is greater than 5")
else
    print(x .. " is not greater than 5")
end