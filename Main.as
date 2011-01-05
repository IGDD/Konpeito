package 
{
	import Blocks.EmptyBlock;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import TDEvents.TDBlockEvent;
	import Towers.*;
	
	/**
	 * ...
	 * @author myuu
	 */
	public class Main extends Sprite 
	{
		private var blocks : Array;
		private var dart : Design_Kp000;
		private var blockCursor : Design_BlockCursor;
		
		public function Main()
		{
			// Init the map.
			blocks = new Array();
			for (var i : int = 0; i < 12; ++i)
			{
				blocks[i] = new Array();
				for (var j : int = 0; j < 7; ++j)
				{
					blocks[i][j] = new EmptyBlock();
					addChild(blocks[i][j]);
					blocks[i][j].x = 40 * i;
					blocks[i][j].y = 40 * (j+2);
				}
			}
			
			// Create a dart.
			dart = new Design_Kp000();
			
			blockCursor = new Design_BlockCursor();
			addEventListener(TDBlockEvent.BLOCK_CLICKED, blockClickHandler, true);
		}
		
		private function moveDart(e : TDBlockEvent) : void
		{
			if (!this.contains(dart))
			{
				addChild(dart);
			}
			
			dart.x = e.gridX;
			dart.y = e.gridY;
		}
		
		private function moveBlockCursor(xIndex : int, yIndex : int) : void
		{			
			addChildAt(blockCursor, numChildren);
			trace(getChildIndex(blockCursor));
				
			blockCursor.x = blocks[xIndex][yIndex].x + 20;
			blockCursor.y = blocks[xIndex][yIndex].y - 20;
		}
		
		private function blockClickHandler(e : TDBlockEvent) : void
		{
			var xIndex : int = e.gridX / 40;
			var yIndex : int = e.gridY / 40 - 2;
			var b : EmptyBlock = blocks[xIndex][yIndex] as EmptyBlock;
			
			b.setCursor(blockCursor);
			b.setOccupant(TowerFactory.createTower(TowerTypes.DUMMY_TOWER) as Sprite);
		}
	}
}