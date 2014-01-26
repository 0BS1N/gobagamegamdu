input = require("input")
vector = require("libs.hump.vector")
require("square")
require("player")
require("camera")
require("scene")

function love.load()
  winWidth, winHeight = love.window.getDimensions()
  input.register()

  player = Player({pos = vector(30, 30), size = 50, color = {20, 30, 160}})
  world_vers = 2
  camera = Camera(player, winHeight/2)
  scene1 = Scene("scene1")
  activeScene = scene1
  activeScene:add("player", player)
end

function love.update( dt )
  input.update(dt)
  activeScene:update(dt)
end

function drawBG( )
  love.graphics.setColor(128, 128, 128)
  love.graphics.rectangle('fill', 0, (winHeight-camera.horizon), winWidth, 1000)
end

function love.draw() 
  drawBG()
  activeScene:draw(camera)
end

