import Toybox.Activity;
import Toybox.Lang;
import Toybox.Time;
import Toybox.WatchUi;

using Toybox.Math;

class SalzA_Time {
  function time_function(salzA_distance_meters, salzA_time_seconds) {
    var ret = "";

    var timeDiff_seconds = salzA_time_seconds;

    if (salzA_time_seconds < 0) {
      timeDiff_seconds = -timeDiff_seconds;
      ret = "-";
    }

    var hours = Math.floor(timeDiff_seconds / 60 / 60);
    var minutes = Math.floor((timeDiff_seconds - hours * 60 * 60) / 60);
    var seconds = Math.floor(timeDiff_seconds - hours * 60 * 60 - minutes * 60);

    if (hours > 0) {
      ret = ret + hours + "h";
    }

    if (hours > 0 || minutes > 0) {
      ret = ret + minutes + "m";
    }

    return ret + seconds + "s";
  }
}

class SalzA_TimeView extends WatchUi.SimpleDataField {
  function initialize() {
    SimpleDataField.initialize();
    label = "ČAS DO LIM.";
  }

  function compute(info) {
    var time = new SalzA_Time();
    var func = time.method( : time_function);
    return limitLogic(info, func);
  }
}