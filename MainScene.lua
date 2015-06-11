local StartScene = require("app.scenes.StartScene")

local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    local bg = cc.Sprite:create("pic/bg1.png")
    bg:pos(display.cx, display.cy)
    local scaleX = display.width/bg:getContentSize().width
    local scaleY = display.height/bg:getContentSize().height
    bg:setScaleX(scaleX)
    bg:setScaleY(scaleY)
    bg:addTo(self)

    local caocong = cc.ProgressTimer:create(cc.Sprite:create("pic/caocong.png"))
    caocong:setPosition(display.cx,display.cy/2)
    caocong:setBarChangeRate(cc.p(1,0))
    caocong:setMidpoint(cc.p(0,0.5))
    caocong:setType(display.PROGRESS_TIMER_BAR)
    caocong:setPercentage(0)
    caocong:setScale(0.5)
    caocong:addTo(self)

    local progress = cc.ProgressTo:create(2,100)
 	local changeScene = cc.CallFunc:create(function()
 		local scene = StartScene.new()
 		local turn = cc.TransitionPageTurn:create(1,scene,false)
 		cc.Director:getInstance():replaceScene(turn)
 	end)
 	
 	local seq = cc.Sequence:create(progress,changeScene)
    caocong:runAction(seq)
end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
