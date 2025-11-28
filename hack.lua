local RepStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = RepStorage:WaitForChild("RemoteEvent")

-- Settings for how many times to fire GainMuscle and delay between each
local ACTIONS_PER_FIRE_REMOTE = 1000
local DELAY_PER_ACTION = 0.01

local function FireGainMuscle()
    -- Fires the 'GainMuscle' remote ACTIONS_PER_FIRE_REMOTE times
    for i = 1, ACTIONS_PER_FIRE_REMOTE do
        local args = {
            [1] = {
                [1] = "GainMuscle"
            }
        }
        RemoteEvent:FireServer(unpack(args))
        task.wait(DELAY_PER_ACTION)
    end
    print("Completed 1000 'GainMuscle' actions inside FireGainMuscle.")
end

print("Starting the FOREVER loop. This will continuously fire 1000 'GainMuscle' actions per cycle.")

-- The loop below repeats forever
while true do
    FireGainMuscle()
end
