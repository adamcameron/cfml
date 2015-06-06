 import mx.core.UIComponent
 import mx.controls.ComboBox;
 class ComboBoxCellRenderer extends UIComponent{
        [Event("cellEdit")]
        var combo : MovieClip;
        var listOwner : MovieClip; // the reference we receive to the list
        var getCellIndex : Function; // the function we receive from the list
        var     getDataLabel : Function; // the function we receive from the list
        var rowData : Object;

        function createChildren(Void) : Void
        {      
			//Creates a ComboBox object and listen to changes
			createClassObject(ComboBox, "combo", 1, {styleName:this, owner:this, selectable:true});
			combo.addEventListener("change", this);
			
			size();
        }

        function size(Void) : Void
        {
			combo.setSize(__width-(__width-150)/2, 20);
			combo.x =(__width-150)/2;
			combo.y =(__height-20)/2;
        }

        function setValue(str:String, item:Object, sel:Boolean) : Void
        {       //Get values from the dataProvider
			combo._visible =(item!=undefined);
			if (item!=undefined){
				combo.dataProvider = item.comboData.dp;
				combo.selectedIndex = item.comboData.index;
			}
			rowData = item;
        }

        function getPreferredHeight(Void) : Number
        {
			return 21;
        }

        function getPreferredWidth(Void) : Number
        {
			return 20;
        }
        function change()      
        {
			rowData.comboData.index = combo.selectedIndex;
			
			listOwner.dispatchEvent({type:'cellEdit',itemIndex:getCellIndex().itemIndex});
        }

        function draw():Void
        {
			super.draw();

			// workaround bug
			if (combo.text_mc.border_mc.getDepth() > combo.text_mc.label.getDepth()) {
				combo.text_mc.border_mc.swapDepths(combo.text_mc.label);
			}      
        }

 } 