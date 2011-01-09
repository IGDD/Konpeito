package Blocks 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import TDEvents.TDBlockEvent;
	
	/**
	 * ...
	 * @author myuu
	 */
	public class EmptyBlock extends Sprite
	{
		private var m_design : Sprite;
		
		public function EmptyBlock() 
		{
			addChild(m_design = new Design_GroundGrid_000());
			
			addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
			
			addEventListener(MouseEvent.CLICK, clickHandler, true);
		}
		
		private function mouseOverHandler(e : MouseEvent) : void
		{
			if (m_design.alpha != 0)
				m_design.alpha = 0.7;
		}
		
		private function mouseOutHandler(e : MouseEvent) : void
		{
			if (m_design.alpha != 0)
				m_design.alpha = 1;
		}
		
		private function clickHandler(e : MouseEvent) : void
		{	
			dispatchEvent(new TDBlockEvent(TDBlockEvent.BLOCK_CLICKED, this.x, this.y));
			e.stopPropagation();
		}
	}
}