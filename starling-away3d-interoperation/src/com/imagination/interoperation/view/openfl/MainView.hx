package com.imagination.interoperation.view.openfl;

import openfl.display.Sprite;

/**
 * ...
 * @author P.J.Shand
 */

@:rtti
@:keepSub
class MainView extends Sprite
{

	public function new() 
	{
		super();
	}
	
	public function initialize() 
	{
		var subView:SubView = new SubView();
		addChild(subView);
	}
}