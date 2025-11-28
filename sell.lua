local RepStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = RepStorage:WaitForChild("RemoteEvent")

-- Settings for how many times to fire GainMuscle and delay between each
local ACTIONS_PER_FIRE_REMOTE = 1000
local DELAY_PER_ACTION = 0.01

local function FireGainMuscle()
    local args = {
    [1] = {
        [1] = "SellMuscle"
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))


local numberOfCycles = 100000 -- Repeat blocks of gain muscle
local delayBetweenCycles = 0 -- Handled by inner wait

print("Starting the FOREVER loop. This will continuously fire 1000 'GainMuscle' actions per cycle.")

while true do
    print("\n--- Starting new cycle of " .. numberOfCycles .. " blocks of 1000 'GainMuscle' actions ---")
    for cycle = 1, numberOfCycles do
        FireGainMuscle()
        print("Completed cycle block: " .. cycle .. " / " .. numberOfCycles)
    end
    print("--- Finished massive cycle. Restarting immediately. ---")
end
