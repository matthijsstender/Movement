package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.display.*;
	import flash.ui.Keyboard;
	
	public class Player extends MovieClip {
		public var rightPressed:Boolean = false;
		public var leftPressed:Boolean = false;
		public var upPressed:Boolean = false;
		public var downPressed:Boolean = false;
		public var playerSpeed:Number = 8;
		public var dir:Vector2 = new Vector2(0,0);
		public var angle:Number;
		public var hitting:Boolean;
		
		public var bwColl:Boolean = false;
		public var twColl:Boolean = false;
		public var rwColl:Boolean = false;
		public var lwColl:Boolean = false;
		
		public function Player(main:Stage) {
			// constructor code
			
			main.stage.addEventListener(KeyboardEvent.KEY_DOWN, movement);
			main.stage.addEventListener(KeyboardEvent.KEY_UP, nonMovement);
			this.addEventListener(Event.ENTER_FRAME, addSpeed);
			this.addEventListener(Event.ENTER_FRAME, lookAtMouse);
		}
		public function lookAtMouse(e:Event):void {
			var mouse: Vector2 = new Vector2(stage.mouseX,stage.mouseY);
			var pos:Vector2 = new Vector2(this.x,this.y);
			var dir:Vector2 = Vector2.sub(mouse,pos);
			var rad:Number = dir.getAngle();
			angle = Vector2.rad2deg(rad);
			this.rotation = angle;
		}
		public function movement(keyEvent:KeyboardEvent):void {
			if(keyEvent.keyCode == Keyboard.D) {
				rightPressed = true;
			}
			if(keyEvent.keyCode == Keyboard.A) {
				leftPressed = true;
			}
			if(keyEvent.keyCode == Keyboard.W) {
				upPressed = true;
			}
			if(keyEvent.keyCode == Keyboard.S) {
				downPressed = true;
			}
		}
		public function nonMovement(keyEvent:KeyboardEvent):void {
			if(keyEvent.keyCode == Keyboard.D) {
				rightPressed = false;
			}
			if(keyEvent.keyCode == Keyboard.A) {
				leftPressed = false;
			}
			if(keyEvent.keyCode == Keyboard.W) {
				upPressed = false;
			}
			if(keyEvent.keyCode == Keyboard.S) {
				downPressed = false;
			}
		}
		public function addSpeed(e:Event):void {
			if (rightPressed == true && !rwColl) {
				this.x += playerSpeed;
			}
			if (leftPressed == true && !lwColl) {
				this.x -= playerSpeed;
			}
			if (upPressed == true && !twColl) {
				this.y -= playerSpeed;
			}
			if (downPressed == true && !bwColl) {
				this.y += playerSpeed;
			}
		}
	}
}