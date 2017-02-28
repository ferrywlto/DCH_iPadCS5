package  {
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.filters.DropShadowFilter;
	
	public class SelectCarMC extends Sprite
	{
		private var stateMachine:StateMachine;
		public function SelectCarMC() 
		{
			stateMachine = new StateMachine(this);
			stateMachine.AddTransition("Login", transitToLogin);
			stateMachine.AddTransition("Brand", transitToBrand);
			stateMachine.AddTransition("Car", transitToCar);
			stateMachine.AddTransition("Detail", transitToDetail);
			
			StateManager.AddObserver(stateMachine);
			for(var i:uint=0; i<9; i++)
			{
				this["cmc"+i].addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
				this["cmc"+i].addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
				this["cmc"+i].addEventListener(MouseEvent.CLICK, onMouseClick);
				this["cmc"+i].cacheAsBitmap = true;
				this["cmc"+i].cacheAsBitmapMatrix = new Matrix();	
			}
		}
		public function onMouseClick(event:MouseEvent):void
		{
			StateManager.TransitState("Detail");
		}
		public function onMouseOver(event:MouseEvent):void
		{
			event.target.filters = [new DropShadowFilter(), new GlowFilter(0x00FFFF,1,10,10,5,3)];
		}
		public function onMouseOut(event:MouseEvent):void
		{
			event.target.filters = [new DropShadowFilter()];
		}
		public function transitToCar():void
		{
			this.x = 512-this.width/2;
			this.y = 384-this.height/2;
			trace("SelectCarMC:transitToCar");
			this.visible = true;
		}
		public function transitToDetail():void
		{
			trace("SelectCarMC:transitToDetail");
			this.visible = false;
		}
		public function transitToLogin():void
		{
			trace("SelectCarMC:transitToLogin");
			this.visible = false;
		}
		public function transitToBrand():void
		{
			trace("SelectCarMC:transitToBrand");
			this.visible = false;
		}
	}
	
}
