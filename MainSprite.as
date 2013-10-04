package  {
	import starling.display.Sprite;
	import starling.textures.RenderTexture;
	import starling.display.Image;
	import starling.events.Event;
	import starling.events.TouchEvent;
	
	
	import flash.geom.Matrix;
	import starling.events.TouchPhase;
	import starling.events.Touch;
	
	public class MainSprite extends Sprite
	{
		private var numParticles:uint = 2000;
		private var particles:Array = [];
		
		
		public function MainSprite() 
		{
			this.addEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
			
			
		}
		
		private function onAddedToStage( event:Event ) :void
		{
			for(var i=0; i<numParticles; ++i ) {
				var particle:QuadParticle = new QuadParticle();
				addChild( particle );
				particles.push( particle );
			}
			
			this.addEventListener( Event.ENTER_FRAME, onEnterFrame );
			stage.addEventListener( TouchEvent.TOUCH, onTouch);
		}
		
		private function onEnterFrame( event:Event ) : void
		{
			for each( var p:QuadParticle in particles ) {
				p.update();
				if( p.x < 0 || p.x > 800 || p.y < 0 || p.y > 600 || p.alpha < 0.01 ) {
					p.resetAttributes();
				}
			}
		}
		
		private function onTouch( event:TouchEvent ) :void
		{
			var touch:Touch = event.getTouch( stage );
			if( touch && touch.phase == TouchPhase.HOVER ) {
				QuadParticle.CENTER_X = touch.globalX;
				QuadParticle.CENTER_Y = touch.globalY;
			}
		}
		

	}
	
}
