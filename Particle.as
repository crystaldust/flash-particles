package  {
	import starling.display.Sprite;
	import starling.textures.RenderTexture;
	import flash.display.BitmapData;
	import starling.textures.Texture;
	import starling.display.Image;
	
	public class Particle
	{
		public static var STAGE_WIDTH:Number = 800;
		public static var STAGE_HEIGHT:Number = 600;
		
		private var vx:Number;
		private var vy:Number;
		private var ax:Number;
		private var ay:Number;
		private var va:Number;
		public var x:Number;
		public var y:Number;
		public var alpha:Number;
		private var color:uint;
		private var radius:Number;
		
		public var bmpd:BitmapData;
		public var texture:Texture;
		public var img:Image;
		
		public function Particle() 
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
			this.x = Particle.STAGE_WIDTH / 2;
			this.y = Particle.STAGE_HEIGHT / 2 ;
			this.alpha = 1;
			
			this.vx = Math.random() * 10 - 5;
			this.vy = Math.random() * 10 - 5;
			this.ax = Math.random() * 0.2 - 0.1;
			this.ay = Math.random() * 0.2 - 0.1;
			this.va = Math.random() * 0.1 + 0.01;
			
			this.color = uint( Math.random() * 0xffffff );
			this.radius = Math.random() * 10 + 4;
			
			if( this.bmpd ) {
				this.bmpd.dispose();
				this.bmpd = null;
			}
			this.bmpd = Drawer.getCircle( this.color, this.radius );
			this.texture = Texture.fromBitmapData( this.bmpd );
			this.img = new Image( this.texture );
		}
		
		
		
	}
	
}
