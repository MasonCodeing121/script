local RepStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = RepStorage:WaitForChild("RemoteEvent")

-- Define the number of times the action should be fired INSIDE a single function call
local ACTIONS_PER_FIRE_REMOTE = 1000 
local DELAY_PER_ACTION = 0.01

local function FireRemote()
    -- This internal loop fires the 'GainMuscle' remote 1000 times
    for i = 1, ACTIONS_PER_FIRE_REMOTE do
        -- GainMuscle
        local argsGain = {
            [1] = {
                [1] = "GainMuscle" -- The action string
            }
        }
        RemoteEvent:FireServer(unpack(argsGain))

        -- Immediately after, SellMuscle
        local argsSell = {
            [1] = {
                [1] = "SellMuscle"
            }
        }
        RemoteEvent:FireServer(unpack(argsSell))

        -- Wait a small delay between each action fire
        task.wait(DELAY_PER_ACTION) 
    end
    print("Completed 1000 'GainMuscle'+'SellMuscle' action pairs within FireRemote.")
end

-- The variables for the external loop are removed, as the main action is now inside FireRemote
local numberOfCycles = 100000 -- This number now dictates how many times the 1000-fire-block runs
local delayBetweenCycles = 0 -- We will let the inner task.wait handle the time

print("Starting the FOREVER loop. This will continuously fire 1000 'GainMuscle'+'SellMuscle' pairs per cycle.")

-- The 'while true do' loop runs the code block forever
while true do
    print("\n--- Starting new cycle of " .. numberOfCycles .. " blocks of 1000 action pairs ---")
    
    -- Inner loop to run the FireRemote function 'numberOfCycles' times
    for cycle = 1, numberOfCycles do
        -- Calling FireRemote executes 1000 pairs internally
        FireRemote() 
        print("Completed cycle block: " .. cycle .. " / " .. numberOfCycles)
    end
    
    -- Print when the entire large loop has finished its iteration
    print("--- Finished massive cycle. Restarting immediately. ---") 
end
