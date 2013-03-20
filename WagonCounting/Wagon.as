package  {
	import flash.display.MovieClip
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.EventDispatcher;
	
	public class Wagon extends MovieClip{
		//public var nativePos:Number;
		private var lightOn:Boolean = false;
		private var _dir:int;
		public var lamp:MovieClip;
		
		public function set dir(where:int):void { _dir = where; }
		public function get dir():int { return _dir; }
		public function set light(how:Boolean):void{lightOn = how; lamp.gotoAndStop(int(lightOn)+1);}
		public function get light():Boolean{return lightOn;}
		
		public function Wagon() {
			// constructor code
			//nativePos = this.x;
			lamp.addEventListener(MouseEvent.CLICK, changeLight);
			
		}
		
		private function changeLight(e:MouseEvent):void 
		{
			lightOn = !lightOn; 
			lamp.gotoAndStop(int(lightOn) + 1);
			
			dispatchEvent(new Event(Event.CHANGE));
		}
		
	}
	
}
