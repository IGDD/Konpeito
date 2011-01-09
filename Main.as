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
		public static const NUM_OF_ROWS : int = 7;
		public static const NUM_OF_COLS : int = 12;
		
		private var blockLayer : Sprite;
		private var objectLayer : Sprite;
		
		private var objectRows : Array;
		private var blocks : Array;
		private var dart : Design_Kp000;
		private var blockCursor : Design_BlockCursor;
		
		public function Main()
		{
			// Init the map: blocks.
			addChild(blockLayer = new Sprite());			
			blocks = new Array();
			for (var i : int = 0; i < NUM_OF_COLS; ++i)
			{
				blocks[i] = new Array();
				for (var j : int = 0; j < NUM_OF_ROWS; ++j)
				{
					blocks[i][j] = new EmptyBlock();
					blockLayer.addChild(blocks[i][j]);
					blocks[i][j].x = 40 * i;
					blocks[i][j].y = 40 * (j+2);
				}
			}
			
			// Init the rows for simplistic z-indexing.
			addChild(objectLayer = new Sprite());
			objectRows = new Array();
			for (var k : int = NUM_OF_ROWS; k >= 0; --k)
			{
				var r : Sprite = new Sprite();
				objectLayer.addChild(r);
				objectRows[k] = r;
			}
			
			blockCursor = new Design_BlockCursor();
			
			// Set up the TDBlockEvent handler.
			addEventListener(TDBlockEvent.BLOCK_CLICKED, blockClickHandler, true);
		}
		
		private function moveBlockCursorTo(x : int, y : int) : void
		{			
			blockLayer.addChild(blockCursor);				
			blockCursor.x = x;
			blockCursor.y = y;
		}

		private function createTowerAt(x : int, y: int) : void
		{
			var t : Sprite = TowerFactory.createTower(TowerTypes.DUMMY_TOWER) as Sprite;
			t.x = x;
			t.y = y;
			var rowIndex : int = NUM_OF_ROWS - ((y - 80) / 40) - 1;
			objectRows[rowIndex].addChild(t);
		}
		
		private function blockClickHandler(e : TDBlockEvent) : void
		{
			moveBlockCursorTo(e.gridX+20, e.gridY-20);
			createTowerAt(e.gridX, e.gridY);
		}
	}
}