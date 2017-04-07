package com.wmjalak.cordova.boottime;

import org.apache.cordova.CallbackContext;
import org.json.JSONArray;
import org.json.JSONException;

import android.os.SystemClock;

import org.apache.cordova.CordovaPlugin;

public class BootTime extends CordovaPlugin {

    CallbackContext mCallbackContext;

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("get")) {
            callbackContext.success(Long.toString(SystemClock.elapsedRealtime()));
        } else {
            callbackContext.error("Invalid action");
            return false;
        }
        return true;
    }

}
