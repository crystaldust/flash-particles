package {
	import starling.display.Sprite;
	import starling.display.Quad;
	
	public class QuadParticle extends Sprite {
		
		public static var CENTER_X:Number = 400;
		public static var CENTER_Y:Number = 300;
		
		private var q:Quad;
		
		private var vx:Number;
		private var vy:Number;
		private var ax:Number;
		private var ay:Number;
		private var va:Number;
		
		private var color:uint;
		private var radius:Number;
		
		public function QuadParticle() 
		{
			this.resetAttributes();
		}
		
		public function update():void
		{
			this.x += this.vx;
			this.y += this.vy;
			this.vx += this.ax;
			this.vy += this.ay;
			this.alpha -= this.va;
		}
		
		public function resetAttributes():void
		{
			this.x = CENTER_X;
			this.y = CENTER_Y;
			this.alpha = 1;
			
			this.blendMode = "add";
			
			this.vx = Math.random() * 10 - 5;
			this.vy = Math.random() * 10 - 5;
			this.ax = Math.random() * 0.2 - 0.1;
			this.ay = Math.random() * 0.2 - 0.1;
			this.va = Math.random() * 0.1 + 0.01;
			
			this.color = uint( Math.random() * 0xffffff );
			this.radius = Math.random() * 10 + 4;
			if( this.q ) {
				this.q.dispose();
				this.removeChild( q );
				this.q = null;
			}
			
			
			this.q = new Quad( this.radius, this.radius, this.color );
			this.addChild( q );
			q.x = - this.radius >> 1;
			q.y = - this.radius >> 1;
		}

	}
	
}
