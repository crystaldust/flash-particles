package  {
	import flash.display.Sprite;
	import flash.display.BitmapData;
	
	public class Drawer
	{
		private static var sprite:Sprite = new Sprite();
		public function Drawer() {
			// constructor code
		}
		
		public static function getCircle( color, radius ) : BitmapData
		{
			sprite.graphics.clear();
			sprite.graphics.beginFill( color );
			sprite.graphics.drawCircle( radius >> 1, radius >> 1, radius );
			sprite.graphics.endFill();
			
			var bmpd:BitmapData = new BitmapData( radius * 2, radius * 2, true, 0 );
			bmpd.draw( sprite );
			return bmpd;
		}
		

	}
	
}
