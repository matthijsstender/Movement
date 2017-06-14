package  {
	import flash.utils.Timer;
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.utils.Endian;
	
	
	public class Main extends MovieClip {
		var player:Player;
		public var bulletList:Array = [];
		var enemy:Enemy;
		var spawner:Spawner;
		var mybWall:MovieClip;
		var mytWall:MovieClip;
		var myrWall:MovieClip;
		var mylWall:MovieClip;
		
		public function Main() {
			// constructor code
			//BottomWall
			mybWall = new bWall();
			mybWall.x = 750;
			mybWall.y = 1110;
			this.addChild(mybWall);
			//TopWall
			mytWall = new tWall();
			mytWall.x = 750;
			mytWall.y = 4,5;
			this.addChild(mytWall);
			//RightWall
			myrWall = new rWall();
			myrWall.x = 1480;
			myrWall.y = 555;
			this.addChild(myrWall);
			//LeftWall
			mylWall = new lWall();
			mylWall.x = 10;
			mylWall.y = 555;
			this.addChild(mylWall);
			player = new Player(stage);
			this.addChild(player);
			player.x = stage.width/2;
			player.y = stage.height/2;
			Constants.playerRef = player;
			spawner = new Spawner();
			stage.addChild(spawner);
			enemy = new Enemy(this);
			this.addChild(enemy);
			enemy.x = stage.width/2;
			enemy.y = stage.height/2;
			this.addEventListener(Event.ENTER_FRAME, Update);
		}
		public function loop(e:Event):void {
            if(bulletList.length > 0) {
                for(var i:int = 0; i <= bulletList.length; i++) {
                    bulletList[i].loop();
					if (bulletList[i].hitTestObject(enemy)) {
						this.removeChild(enemy);
						this.removeChild(bulletList[i]);
						bulletList.splice(bulletList.indexOf(e.currentTarget),i);
					}
                }
            }
        }
		public function shootBullet(e:MouseEvent):void {
			var bullet:Bullet = new Bullet(stage, player.x, player.y, player.rotation);
			bullet.addEventListener(Event.REMOVED_FROM_STAGE, bulletRemoved, false, 0, true);
            bulletList.push(bullet);
			this.addChild(bullet);
		}
		public function bulletRemoved(e:Event):void {
            e.currentTarget.removeEventListener(Event.REMOVED_FROM_STAGE, bulletRemoved);
            bulletList.splice(bulletList.indexOf(e.currentTarget),1);
        }
		//BottomWall
		public function bwallCol(e:Event) {
			if (player.hitTestObject(mybWall)) {
				player.bwColl = true;
			}else{
				player.bwColl = false;
			}
		}
		//TopWall
		public function twallCol(e:Event) {
			if (player.hitTestObject(mytWall)) {
				player.twColl = true;
			}else{
				player.twColl = false;
			}
		}
		//RightWall
		public function rwallCol(e:Event) {
			if (player.hitTestObject(myrWall)) {
				player.rwColl = true;
			}else{
				player.rwColl = false;
			}
		}
		//LeftWall
		public function lwallCol(e:Event) {
			if (player.hitTestObject(mylWall)) {
				player.lwColl = true;
			}else{
				player.lwColl = false;
			}
		}
		public function Update(e:Event){
			enemy.Update();
			stage.addEventListener(MouseEvent.CLICK, shootBullet, false, 0, true);
			stage.addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
			this.addEventListener(Event.ENTER_FRAME, bwallCol);
			this.addEventListener(Event.ENTER_FRAME, twallCol);
			this.addEventListener(Event.ENTER_FRAME, rwallCol);
			this.addEventListener(Event.ENTER_FRAME, lwallCol);
		}
	}
}