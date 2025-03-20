function RageUI.Info(Title, RightText, LeftText)
    local LineCount = #RightText >= #LeftText and #RightText or #LeftText
    if Title ~= nil then
        RenderText("~h~" .. Title .. "~h~", 450 + 20 + 100, 80, 0, 0.34, 255, 255, 255, 255, 0)
    end
    if RightText ~= nil then
        RenderText(table.concat(RightText, "\n"), 330 + 20 + 100, Title ~= nil and 120 or 7, 0, 0.28, 255, 255, 255, 255, 15)
    end
    if LeftText ~= nil then
        RenderText(table.concat(LeftText, "\n"), 330 + 432 + 100, Title ~= nil and 120 or 7, 0, 0.28, 255, 255, 255, 255, 2)
    end
    RenderRectangle(330 + 10 + 100, 80, 432, Title ~= nil and 50 + (LineCount * 20) or ((LineCount + 1) * 20), 0, 0, 0, 160)
end