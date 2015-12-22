package com.imagination.interoperation.view.away3d;

import away3d.core.managers.RTTBufferManager;
import away3d.core.managers.Stage3DManager;
import away3d.core.managers.Stage3DProxy;
import away3d.entities.Mesh;
import away3d.events.Stage3DEvent;
import away3d.materials.ColorMaterial;
import away3d.primitives.CubeGeometry;
import away3d.primitives.PlaneGeometry;
import com.imagination.interoperation.view.away3d.display.ExampleAwayObject;
import openfl.events.Event;
import robotlegs.bender.extensions.stage3D.away3d.impl.AwayLayer;

/**
 * ...
 * @author P.J.Shand
 */

@:rtti
@:keepSub
class MainAwayLayer2 extends AwayLayer 
{
	var exampleAwayObject:ExampleAwayObject;
	public function new(profile:String) 
	{
		super(profile);
	}
	
	public function initialize():Void 
	{
		exampleAwayObject = new ExampleAwayObject(400, 0x55FF99);
		scene.addChild(exampleAwayObject);
		
		exampleAwayObject.z = -400;
		this.stage.addEventListener(Event.ENTER_FRAME, Update);
	}
	
	private function Update(e:Event):Void 
	{
		exampleAwayObject.update();
	}
	
	override public function process():Void
	{
		this.render();
	}
	
	override private function onAddedToStage(event:Event):Void
    {
        if (_addedToStage)
            return;
        
        _addedToStage = true;
        
        if (_stage3DProxy==null) {
            _stage3DProxy = Stage3DManager.getInstance(stage).getStage3DProxy(0, _forceSoftware, _profile);
            _stage3DProxy.addEventListener(Stage3DEvent.VIEWPORT_UPDATED, onViewportUpdated);
            if (_callbackMethod!=null) {
                _stage3DProxy.setRenderCallback(_callbackMethod);
            }       
        }
        
        _globalPosDirty = true;
        
        _rttBufferManager = RTTBufferManager.getInstance(_stage3DProxy);
        
        _renderer.stage3DProxy = _depthRenderer.stage3DProxy = _stage3DProxy;
        
        //default wiidth/height to stageWidth/stageHeight
        if (_width == 0)
            width = stage.stageWidth;
        else
            _rttBufferManager.viewWidth = Std.int(_width);
        if (_height == 0)
            height = stage.stageHeight;
        else
            _rttBufferManager.viewHeight = Std.int(_height);
        
        if (_shareContext)
            _mouse3DManager.addViewLayer(this);
    }
}