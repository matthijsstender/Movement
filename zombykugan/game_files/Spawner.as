package  {
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class Spawner extends MovieClip{
		private var enemySpawnTimer:Number;
		private var enemySpawnTimerMax:Number;
		public function Spawner() {
			// constructor code
			initi();
		}
		private function initi() {
			enemySpawnTimerMax = 5*30;
			enemySpawnTimer = enemySpawnTimerMax;
			addEventListener(Event.ENTER_FRAME, spawnEvents);
		}
		private function spawnEvents(e:Event) {
			enemySpawnTimer--;
			if(enemySpawnTimer == 0) {
				//random number gen to pick which side of the stage to spawn on
				var randomSideNumber = int (Math.random()*4);
				
				switch(randomSideNumber) {
					case 0: spawnEnemyTop();
					break;
					
					case 1: spawnEnemyRight();
					break;
					
					case 2: spawnEnemyBottom();
					break;
					
					case 3: spawnEnemyLeft();
					break;
				}
				enemySpawnTimer=enemySpawnTimerMax;
			}
		}
		
		private function spawnEnemy(xPos:Number, yPos:Number) {
			var enemy:Enemy;
			enemy = new Enemy(stage);
			enemy.x = xPos;
			enemy.y = yPos;
			enemy.setTarget(Constants.playerRef);
			Constants.stageRef.addChild(enemy);
		}
		
		private function spawnEnemyTop() {
			spawnEnemy(Math.random()*1480,-30);
		}
		private function spawnEnemyRight() {
			spawnEnemy(1510,Math.random()*1480);
		}
		private function spawnEnemyBottom() {
			spawnEnemy(Math.random()*1480,1510);
		}
		private function spawnEnemyLeft() {
			spawnEnemy(-30,Math.random()*1480);
		}
	}
}