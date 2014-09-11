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
import flash.utils.ByteArray;
import com.renaun.PathFinder;

public class BoardRenderer extends Sprite
{
	public function BoardRenderer(pather:PathFinder, tileSize:int = 20)
	{
		this.pather = pather;
		this.tileSize = tileSize;
		render();
	}
	
	protected var pather:PathFinder;
	protected var tileSize:int;
	
	private function render():void
	{
		var mapBytes:ByteArray = pather.getMap();
		graphics.clear();
		
		for (var i:int = 0; i < pather.mapRowSize; i++) 
			for (var j:int = 0; j < pather.mapColSize; j++)
				drawTile(mapBytes.readByte(), j, i);
	}
	
	private function drawTile(type:int, x:int, y:int):void
	{
		var color:uint = (type == 1) ? 0xAAAAAA : 0x663333;
		graphics.beginFill(color);
		graphics.lineStyle(1, 0x222222, 0.5);
		graphics.drawRect(x*tileSize, y*tileSize, tileSize, tileSize);
		graphics.endFill();
	}
	
	public function drawPath(path:Array):void
	{
		graphics.lineStyle(tileSize/3, 0xff0000);
		for (var i:int = 0; i < path.length/2; i++)
		{
			if (i == 0)
				graphics.moveTo( (path[i*2]*tileSize)+(tileSize/2), (path[(i*2)+1]*tileSize)+(tileSize/2));
			graphics.lineTo( (path[i*2]*tileSize)+(tileSize/2), (path[(i*2)+1]*tileSize)+(tileSize/2));
		}
	}
}
}