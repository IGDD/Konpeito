package TDEvents 
{
	import flash.events.Event;
	
	[Event(name="BlockClicked", type="TDEvents.TDBlockEvent")]
	
	/**
	 * ...
	 * @author myuu
	 */
	public class TDBlockEvent extends Event
	{
		public static const BLOCK_CLICKED : String = "BlockClicked";
		
		public var gridX: Number;
		public var gridY: Number;
		
		public function TDBlockEvent(
			type:String, 
			gridX:Number,
			gridY:Number,
			bubbles:Boolean = false, 
			cancelable:Boolean = false
			)
		{
			super(type, bubbles, cancelable);
			this.gridX = gridX;
			this.gridY = gridY;
		}

                 public override function clone() : Event {
                        return new TDBlockEvent(type, gridX, gridY, bubbles, cancelable);
                 }
  }
	}
}