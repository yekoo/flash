package 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import caurina.transitions.Tweener;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.LoaderInfo;
	import flash.utils.setTimeout;
	
	/**
	 * ...
	 * @author yekoo
	 */
	public class Main extends Sprite 
	{
		public var wagons:MovieClip;
		private var w1, w2, w3:Wagon;
		private var wagonsTotal:Vector.<Boolean> = new Vector.<Boolean>();
		private var stepCounter:int = 0;
		
		private var parkingX:Number;
		private var poses:Object = { };
		
		
		public function Main() 
		{
			//init();
			//setTimeout(init, 500);
			init();
		}
		
		private function init():void
		{trace("i1");
			parkingX = wagons.x;
			w1 = wagons.w1;
			w2 = wagons.w2;
			w3 = wagons.w3;
			trace("i2");
			
			poses = { x1:w1.x, x2:w2.x, x3:w3.x };
			trace("i3");
			w1.dir = 1;
			w1.addEventListener(MouseEvent.CLICK, changeWagon);
			w3.dir = -1;
			w3.addEventListener(MouseEvent.CLICK, changeWagon);
			
			
			wagonsTotal[wagonsTotal.length] = true;
			wagonsTotal[wagonsTotal.length] = true;
			wagonsTotal[wagonsTotal.length] = false;
			wagonsTotal[wagonsTotal.length] = true;
			wagonsTotal[wagonsTotal.length] = false;
			
			w2.light = wagonsTotal[0];
		}
		private function changeWagon(e:MouseEvent):void
		{
			trace("ROLL");
			var dir:int = e.currentTarget.dir;
			var shiftX:int = dir < 0 ? wagons.x + w2.width : wagons.x - w2.width;
			wagons.x = shiftX;
			Tweener.addTween(wagons, { x:parkingX, time:2} );
			
			reLightWagons(dir);
		}
		private function reLightWagons(dir:int):void
		{
			stepCounter = (stepCounter + dir) % wagonsTotal.length;
			if (stepCounter < 0) stepCounter = wagonsTotal.length - 1;
			trace("	wag num: " + stepCounter + " is " + wagonsTotal[stepCounter]);
			
			w3.light = wagonsTotal[(stepCounter - 1)<0 ? wagonsTotal.length-1 : stepCounter - 1];
			w2.light = wagonsTotal[stepCounter];
			w1.light = wagonsTotal[(stepCounter + 1)>=wagonsTotal.length ? 0 : stepCounter + 1];//stepCounter + 1
		}
		
	}

}