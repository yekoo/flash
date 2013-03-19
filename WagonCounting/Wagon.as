package  {
	import flash.display.MovieClip
	
	public class Wagon extends MovieClip{
		public var nativePos:Number;
		private var lightOn:Boolean = false;
		private var _dir:int;
		
		public function set dir(where:int):void { _dir = where; }
		public function get dir():int { return _dir; }
		
		
		public function Wagon() {
			// constructor code
			nativePos = this.x;
		}
		public function set light(how:Boolean):void{lightOn = how; lamp.gotoAndStop(int(lightOn)+1);}
		public function get light():Boolean{return lightOn;}
								  

	}
	
}
