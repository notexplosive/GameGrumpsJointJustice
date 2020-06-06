function DrawJoryTrialScreen()

    love.graphics.clear(unpack(colors.black))

    love.graphics.setColor(0, 0, 0, 100)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())

    local blackImage = love.graphics.newImage(settings.main_logo_path)

    local blackScale = 1

    local backW = (dimensions.window_width * 1/7)
    local backX = (dimensions.window_width * 1/24)
    local backY = blackImage:getHeight()*blackScale
    local backH = 60

    local part1W = (dimensions.window_width * 1/7)
    local part1X = (dimensions.window_width * 10.75/24) - part1W
    local part1Y = blackImage:getHeight()*blackScale
    local part1H = 60

    local part2W = (dimensions.window_width * 1/7)
    local part2X = (dimensions.window_width * 15.5/24) - part2W
    local part2Y = blackImage:getHeight()*blackScale
    local part2H = 60

    local part3W = (dimensions.window_width * 1/7)
    local part3X = (dimensions.window_width * 20/24) - part3W
    local part3Y = blackImage:getHeight()*blackScale
    local part3H = 60

    local dx = 8
    local dy = 8

    love.graphics.setColor(0.44,0.56,0.89)
    if TitleSelection == "Back" then
        love.graphics.rectangle("fill", backX-dx, backY-dy, backW+2*dx, backH+2*dy)
    elseif TitleSelection == "Jory's Trial" then
        love.graphics.rectangle("fill", part2X-dx, part2Y-dy, part2W+2*dx, part2H+2*dy)
    else
        love.graphics.rectangle("fill", part1X-dx, part1Y-dy, part1W+2*dx, part1H+2*dy)
    end

    love.graphics.setColor(222, 0, 0)
    love.graphics.rectangle("fill", backX, backY, backW, backH)

    love.graphics.setColor(0.3,0.3,0.3)
    love.graphics.rectangle("fill", part1X, part1Y, part1W, part1H)

    love.graphics.setColor(0.3,0.3,0.3)
    love.graphics.rectangle("fill", part2X, part2Y, part2W, part2H)

    love.graphics.setColor(0.3,0.3,0.3)
    love.graphics.rectangle("fill", part3X, part3Y, part3W, part3H)

    love.graphics.setColor(1,1,1)
    local textScale = 3
    local backText = love.graphics.newText(GameFont, "Back")
    love.graphics.draw(
        backText,
        backX + backW/2-(backText:getWidth() * textScale)/2,
        backY + backH/2-(backText:getHeight() * textScale)/2,
        0,
        textScale,
        textScale
    )

    local part1Text = love.graphics.newText(GameFont, "Part 1")
    love.graphics.draw(
        part1Text,
        part1X + part1W/2-(part1Text:getWidth() * textScale)/1.5,
        part1Y + part1H/2-(part1Text:getHeight() * textScale)/2,
        0,
        textScale,
        textScale
    )

    local part2Text = love.graphics.newText(GameFont, "Part 2")
    love.graphics.draw(
        part2Text,
        part2X + part2W/2-(part2Text:getWidth() * textScale)/2,
        part2Y + part2H/2-(part2Text:getHeight() * textScale)/2,
        0,
        textScale,
        textScale
    )

    local part3Text = love.graphics.newText(GameFont, "Part 3")
    love.graphics.draw(
        part3Text,
        part3X + part3W/2-(part3Text:getWidth() * textScale)/2,
        part3Y + part3H/2-(part3Text:getHeight() * textScale)/2,
        0,
        textScale,
        textScale
    )

    return self
end

sceneSelections = {}
sceneSelections[0] = "Back";
sceneSelections[1] = "Part 1";
sceneSelections[2] = "Part 2";
sceneSelections[3] = "Part 3";
TitleSelection = "Back";
SelectionIndex = 0;

JoryTrialConfig = {
    displayed = false;
    onKeyPressed = function (key)
        print(SelectionIndex..": "..TitleSelection)
        if key == controls.start_button then
            love.graphics.clear(0,0,0);
            if TitleSelection == "Back" then
                screens.browsescenes.displayed = true;
                DrawBrowseScreen();
                screens.jorytrial.displayed = false;
            elseif TitleSelection == "Part 1" then
                NewEpisode(settings.jory_trial_1_path):begin()
                screens.jorytrial.displayed = false;
            elseif TitleSelection == "Part 2" then
                NewEpisode(settings.jory_trial_2_path):begin()
                screens.jorytrial.displayed = false;
            elseif TitleSelection == "Part 2" then
                NewEpisode(settings.jory_trial_3_path):begin()
                screens.jorytrial.displayed = false;
            end
        elseif key == controls.press_right then
            SelectionIndex = SelectionIndex + 1
            if (SelectionIndex > 3) then
                SelectionIndex = 0
            end
            TitleSelection = sceneSelections[SelectionIndex]
        elseif key == controls.press_left then
            SelectionIndex = SelectionIndex - 1
            if (SelectionIndex < 0) then
                SelectionIndex = 3
            end
            TitleSelection = sceneSelections[SelectionIndex]
        end
    end;
    onDisplay = function()
        screens.jorytrial.displayed = true
        screens.browsescenes.displayed = false
    end;
    draw = function()
        if screens.jorytrial.displayed == true then
            DrawJoryTrialScreen()
        end
    end;
}