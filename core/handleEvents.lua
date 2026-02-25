handleEvents = {


}

function handleEvents:event()


	-- Hook UIErrorsFrame:AddMessage so we always get the real error text
	local original_AddMessage = UIErrorsFrame.AddMessage

	UIErrorsFrame.AddMessage = function(frame, msg, r, g, b, id)
    -- Detect facing error
    if msg == ERR_BADATTACKFACING then
        DEFAULT_CHAT_FRAME:AddMessage("Detected facing error: " .. msg)
    end

    -- Detect out of range
    if msg == ERR_OUT_OF_RANGE then
    end

    -- Always call the original function so errors still appear normally
    return original_AddMessage(frame, msg, r, g, b, id)
	end

end