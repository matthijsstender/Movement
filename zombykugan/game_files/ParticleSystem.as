package  {
	import flash.events.*;
	import flash.display.MovieClip;
	
	
	public class ParticleSystem extends MovieClip {
		public var vel:Vector2;
		public var loc:Vector2;
		public var gra:Vector2;
		
		public function ParticleSystem() {
			// constructor code
			vel = new Vector2;
			loc = new Vector2(500,500);
			gra = new Vector2(0,0.5);
			this.addEventListener(Event.ENTER_FRAME, Update);
			trace("test");
			
		}
		public function Update(event) {
			loc.add(gra);
			this.x = loc.x;
			this.y = loc.y;
			trace("hoi");
		}
	}
	
}
