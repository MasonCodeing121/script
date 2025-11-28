local RepStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = RepStorage:WaitForChild("RemoteEvent")

-- Settings for repeating SellMuscle infinitely
local ACTIONS_PER_CYCLE = 1000      -- Number of 'SellMuscle' fires per cycle block
local DELAY_PER_ACTION = 0.01       -- Delay between each action (seconds)

local function FireSellMuscle()
    local args = {
        [1] = {
            [1] = "SellMuscle"
        }
    }
    RemoteEvent:FireServer(unpack(args))
end

print("Starting the infinite SellMuscle loop. Each cycle will fire " .. ACTIONS_PER_CYCLE .. " SellMuscle actions.")

while true do
    print("\n--- Starting new cycle: Firing " .. ACTIONS_PER_CYCLE .. " SellMuscle actions ---")
    for action = 1, ACTIONS_PER_CYCLE do
        FireSellMuscle()
        task.wait(DELAY_PER_ACTION)
    end
    print("--- Finished cycle. Restarting immediately. ---")
end
