local RepStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = RepStorage:WaitForChild("RemoteEvent")

-- Settings for how many times to fire each remote
local GAIN_ACTIONS_PER_CYCLE = 1000    -- Number of 'GainMuscle' fires per cycle
local SELL_ACTIONS_PER_CYCLE = 1000    -- Number of 'SellMuscle' fires per cycle
local DELAY_PER_ACTION = 0.01          -- Delay between each action (seconds)

local function FireGainMuscle()
    for i = 1, GAIN_ACTIONS_PER_CYCLE do
        local args = {
            [1] = {
                [1] = "GainMuscle"
            }
        }
        RemoteEvent:FireServer(unpack(args))
        task.wait(DELAY_PER_ACTION)
    end
    print("Completed " .. GAIN_ACTIONS_PER_CYCLE .. " 'GainMuscle' actions inside FireGainMuscle.")
end

local function FireSellMuscle()
    for action = 1, SELL_ACTIONS_PER_CYCLE do
        local args = {
            [1] = {
                [1] = "SellMuscle"
            }
        }
        RemoteEvent:FireServer(unpack(args))
        task.wait(DELAY_PER_ACTION)
    end
    print("Completed " .. SELL_ACTIONS_PER_CYCLE .. " 'SellMuscle' actions inside FireSellMuscle.")
end

print("Starting the combined GainMuscle and SellMuscle loop. Each cycle will perform gaining then selling actions.")

while true do
    print("\n--- Starting GainMuscle cycle ---")
    FireGainMuscle()
    print("--- GainMuscle cycle complete. Starting SellMuscle cycle ---")
    FireSellMuscle()
    print("--- SellMuscle cycle complete. Restarting loop. ---")
end
