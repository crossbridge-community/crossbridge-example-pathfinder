/*
 * =BEGIN MIT LICENSE
 * 
 * The MIT License (MIT)
 *
 * Copyright (c) 2014 The CrossBridge Team
 * https://github.com/crossbridge-community
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 * 
 * =END MIT LICENSE
 *
 */
package com.renaun.game
{
import flash.display.Sprite;

public class MovableEntity extends Sprite
{
	public function MovableEntity(size:int = 10, type:String = "enemy")
	{
		this.size = size;
		graphics.beginFill( ( (type == "enemy") ? 0xCC0000 : 0x3333AA) , 0.8);
		graphics.lineStyle(2, 0x222222, 0.8);
		graphics.drawCircle(size/2, size/2, size/2);
		graphics.endFill();
	}

	protected var size:int = 10;

	public var tileX:int = 0;
	public var tileY:int = 0;
	public var currentPath:Array;
	
	public function move(tileX:int, tileY:int):void
	{
		this.tileX = tileX;
		this.tileY = tileY;
		x = tileX * size;
		y = tileY * size;
	}
	
	public function moveByPath():void
	{
		if (!currentPath || currentPath.length == 0)
			return;
		
		var newX:int = currentPath.shift(); 
		var newY:int = currentPath.shift();
		move( newX, newY);
	}
}
}