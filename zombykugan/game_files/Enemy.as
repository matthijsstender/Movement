package  {
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.*;
	
	
	public class Enemy extends MovieClip {
		var main:Main;
		var vecDirection:Vector2;
		var vecAcceleration:Vector2;
		var vecLocation:Vector2;
		var vecVelocity:Vector2;
		var maxSpeed:Number;
		var angle:Number;
		
		public function Enemy(_main) {
			this.main = _main;
			vecVelocity = new Vector2(0, 0);
			vecAcceleration = new Vector2(0, 0);
			vecLocation = new Vector2(400, 400);
			maxSpeed = 6;
		}
		public function Update() {
			vecDirection = Vector2.sub(new Vector2(main.player.x, main.player.y), vecLocation);
			vecAcceleration = vecDirection;
			vecVelocity.add(vecAcceleration);
			vecVelocity.limit(maxSpeed);
			vecLocation.add(vecVelocity);
			this.x = vecLocation.x;
			this.y = vecLocation.y;
			
			var rad = vecDirection.getAngle();
			angle = Vector2.rad2deg(rad);
			this.rotation = angle;
		}
	}
}