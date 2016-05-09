import flash.display.MovieClip;
import flash.events.MouseEvent;
import flash.display.SimpleButton;
import flash.external.ExternalInterface;
import flash.events.Event;
import flash.system.System;

import flash.display.MovieClip;
import flash.events.MouseEvent;
import flash.display.SimpleButton;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.external.ExternalInterface;

class ButtonUp extends MovieClip { public function new() { super(); } }
class ButtonOver extends MovieClip { public function new() { super(); } }
class ButtonDown extends MovieClip { public function new() { super(); } }

class Clippy {
  // Main
  static function main() {
    var call:String     = flash.Lib.current.loaderInfo.parameters.call;
    var callBack:String = flash.Lib.current.loaderInfo.parameters.callBack;

    if(callBack == null) callBack = "function(){}";

    flash.Lib.current.stage.scaleMode = flash.display.StageScaleMode.EXACT_FIT;
    flash.Lib.current.stage.align     = flash.display.StageAlign.TOP_LEFT;

    var button:SimpleButton = new SimpleButton();
    button.useHandCursor    = true;
    button.upState          = flash.Lib.attach("ButtonUp");
    button.overState        = flash.Lib.attach("ButtonOver");
    button.downState        = flash.Lib.attach("ButtonDown");
    button.hitTestState     = flash.Lib.attach("ButtonDown");

    button.addEventListener(MouseEvent.CLICK, function(e:MouseEvent) {
      flash.system.System.setClipboard(ExternalInterface.call(call));
      ExternalInterface.call(callBack, 'onClick', call);
    });

    button.addEventListener(MouseEvent.MOUSE_OVER, function(e:MouseEvent) {
      ExternalInterface.call(callBack, 'onMouseEnter', call);
    });

    button.addEventListener(MouseEvent.MOUSE_OUT, function(e:MouseEvent) {
      ExternalInterface.call(callBack, 'onMouseLeave', call);
    });

    flash.Lib.current.addChild(button);
  }
}
