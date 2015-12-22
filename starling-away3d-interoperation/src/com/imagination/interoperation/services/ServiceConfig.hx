package com.imagination.interoperation.services;

import com.imagination.interoperation.services.example.ExampleService;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

/**
 * ...
 * @author P.J.Shand
 */

@:rtti
@:keepSub
class ServiceConfig implements IConfig 
{
	@inject public var injector:IInjector;
	
	public function new() { }
	
	public function configure():Void
	{
		injector.map(ExampleService).asSingleton();
	}
}