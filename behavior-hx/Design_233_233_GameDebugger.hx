package scripts;

import com.stencyl.graphics.G;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;

import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.utils.Utils;

import nme.ui.Mouse;
import nme.display.Graphics;
import nme.display.BlendMode;
import nme.events.Event;
import nme.events.TouchEvent;
import nme.net.URLLoader;

import motion.Actuate;
import motion.easing.Back;
import motion.easing.Cubic;
import motion.easing.Elastic;
import motion.easing.Expo;
import motion.easing.Linear;
import motion.easing.Quad;
import motion.easing.Quart;
import motion.easing.Quint;
import motion.easing.Sine;



class Design_233_233_GameDebugger extends SceneScript
{          	
	
public var _Enabled:Bool;

public var _StepSize:Float;

public var _StrokeThickness:Float;

public var _XCenterOnScreen:Float;

public var _YCenterOnScreen:Float;

public var _DrawOrientation:Bool;

public var _DrawVelocity:Bool;

public var _Text:String;

public var _ActorIDXOffset:Float;

public var _ActorIDYOffset:Float;

public var _DrawActorIDs:Bool;

public var _ExcludeLightweightActors:Bool;

public var _MouseasSceneCoordinates:Bool;

public var _MouseYOffset:Float;

public var _MouseXOffset:Float;

public var _ToggleControl:String;

public var _DrawMousePosition:Bool;

public var _DecreaseGameSpeedControl:String;

public var _IncreaseGameSpeedControl:String;

public var _Font:Font;

public var _VelocityColor:Int;

public var _OrientationColor:Int;

public var _CustomColor:Int;

 
 	public function new(dummy:Int, engine:Engine)
	{
		super(engine);
		nameMap.set("Enabled", "_Enabled");
_Enabled = true;
nameMap.set("Step Size", "_StepSize");
_StepSize = 0.0;
nameMap.set("Stroke Thickness", "_StrokeThickness");
_StrokeThickness = 2.0;
nameMap.set("X Center On Screen", "_XCenterOnScreen");
_XCenterOnScreen = 0.0;
nameMap.set("Y Center On Screen", "_YCenterOnScreen");
_YCenterOnScreen = 0.0;
nameMap.set("Draw Orientation", "_DrawOrientation");
_DrawOrientation = true;
nameMap.set("Draw Velocity", "_DrawVelocity");
_DrawVelocity = true;
nameMap.set("Text", "_Text");
_Text = "";
nameMap.set("Actor ID X-Offset", "_ActorIDXOffset");
_ActorIDXOffset = 0.0;
nameMap.set("Actor ID Y-Offset", "_ActorIDYOffset");
_ActorIDYOffset = 32.0;
nameMap.set("Draw Actor IDs", "_DrawActorIDs");
_DrawActorIDs = false;
nameMap.set("Exclude Lightweight Actors", "_ExcludeLightweightActors");
_ExcludeLightweightActors = true;
nameMap.set("Mouse as Scene Coordinates", "_MouseasSceneCoordinates");
_MouseasSceneCoordinates = false;
nameMap.set("Mouse Y-Offset", "_MouseYOffset");
_MouseYOffset = 0.0;
nameMap.set("Mouse X-Offset", "_MouseXOffset");
_MouseXOffset = 8.0;
nameMap.set("Toggle Control", "_ToggleControl");
nameMap.set("Draw Mouse Position", "_DrawMousePosition");
_DrawMousePosition = false;
nameMap.set("Decrease Game Speed Control", "_DecreaseGameSpeedControl");
nameMap.set("Increase Game Speed Control", "_IncreaseGameSpeedControl");
nameMap.set("Font", "_Font");
nameMap.set("Velocity Color", "_VelocityColor");
_VelocityColor = Utils.getColorRGB(0,128,0);
nameMap.set("Orientation Color", "_OrientationColor");
_OrientationColor = Utils.getColorRGB(128,0,0);
nameMap.set("Custom Color", "_CustomColor");
_CustomColor = Utils.getColorRGB(0,0,128);

	}
	
	override public function init()
	{
		            _StepSize = asNumber(10);
propertyChanged("_StepSize", _StepSize);
        if(_Enabled)
{
            enableDebugDrawing();
}

        else
{
            disableDebugDrawing();
}

    addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if(_Enabled)
{
            if((hasValue(_Font) != false))
{
                g.setFont(_Font);
}

            g.translateToScreen();
            if((_DrawOrientation || (_DrawVelocity || _DrawActorIDs)))
{
                for(actorOnScreen in scene.allActors)
{
if(actorOnScreen != null && !actorOnScreen.dead && !actorOnScreen.recycled && actorOnScreen.isOnScreenCache)
{
                    if(!((_ExcludeLightweightActors && actorOnScreen.isLightweight)))
{
                        g.strokeSize = Std.int(_StrokeThickness);
                        _XCenterOnScreen = asNumber((actorOnScreen.getXCenter() - getScreenX()));
propertyChanged("_XCenterOnScreen", _XCenterOnScreen);
                        _YCenterOnScreen = asNumber((actorOnScreen.getYCenter() - getScreenY()));
propertyChanged("_YCenterOnScreen", _YCenterOnScreen);
                        if(_DrawOrientation)
{
                            g.strokeColor = _OrientationColor;
                            g.drawLine(_XCenterOnScreen, _YCenterOnScreen, (_XCenterOnScreen + (actorOnScreen.getWidth()/2 * Math.cos(Utils.RAD * (Utils.DEG * (actorOnScreen.getAngle()))))), (_YCenterOnScreen + (actorOnScreen.getHeight()/2 * Math.sin(Utils.RAD * (Utils.DEG * (actorOnScreen.getAngle()))))));
}

                        if(_DrawVelocity)
{
                            g.strokeColor = _VelocityColor;
                            g.drawLine(_XCenterOnScreen, _YCenterOnScreen, (_XCenterOnScreen + actorOnScreen.getXVelocity()), (_YCenterOnScreen + actorOnScreen.getYVelocity()));
}

                        if(_DrawActorIDs)
{
                            _Text = (("" + ("" + actorOnScreen.getType())) + ("" + (("" + " (") + ("" + (("" + ("" + actorOnScreen.ID)) + ("" + ")"))))));
propertyChanged("_Text", _Text);
                            g.drawString("" + _Text, ((_XCenterOnScreen - (g.font.font.getTextWidth(_Text)/Engine.SCALE / 2)) + _ActorIDXOffset), ((_YCenterOnScreen - (g.font.getHeight()/Engine.SCALE / 2)) + _ActorIDYOffset));
}

}

}
}

}

            if((_DrawMousePosition && (!(#if mobile true #else false #end) || isMouseDown())))
{
                if(_MouseasSceneCoordinates)
{
                    _Text = (("" + "(") + ("" + (("" + ("" + (getScreenX() + getMouseX()))) + ("" + (("" + ", ") + ("" + (("" + ("" + (getScreenY() + getMouseY()))) + ("" + ")"))))))));
propertyChanged("_Text", _Text);
}

                else
{
                    _Text = (("" + "(") + ("" + (("" + ("" + getMouseX())) + ("" + (("" + ", ") + ("" + (("" + ("" + getMouseY())) + ("" + ")"))))))));
propertyChanged("_Text", _Text);
}

                g.drawString("" + _Text, (getMouseX() + _MouseXOffset), (getMouseY() + _MouseYOffset));
}

}

}
});
    addKeyStateListener(_ToggleControl, function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void {
if(wrapper.enabled && released){
        _Enabled = !(_Enabled);
propertyChanged("_Enabled", _Enabled);
        if(_Enabled)
{
            enableDebugDrawing();
}

        else
{
            disableDebugDrawing();
}

}
});
    addKeyStateListener(_IncreaseGameSpeedControl, function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void {
if(wrapper.enabled && released){
        _StepSize = asNumber(Math.max((_StepSize - 1), 1));
propertyChanged("_StepSize", _StepSize);
        Engine.STEP_SIZE = Std.int(_StepSize);
        trace("" + (("" + "Step Size: ") + ("" + _StepSize)));
}
});
    addKeyStateListener(_DecreaseGameSpeedControl, function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void {
if(wrapper.enabled && released){
        _StepSize = asNumber((_StepSize + 1));
propertyChanged("_StepSize", _StepSize);
        Engine.STEP_SIZE = Std.int(_StepSize);
        trace("" + (("" + "Step Size: ") + ("" + _StepSize)));
}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}