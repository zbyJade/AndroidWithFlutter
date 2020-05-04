package com.zby.androidwithflutter;

import android.app.Application;
import android.content.Context;

import com.idlefish.flutterboost.FlutterBoost;
import com.idlefish.flutterboost.Platform;
import com.idlefish.flutterboost.Utils;
import com.idlefish.flutterboost.interfaces.INativeRouter;

import java.util.Map;

public class BaseApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        // 初始化
        initFlutterBoost();
    }

    private void initFlutterBoost() {
        Platform platform = new FlutterBoost.ConfigBuilder(this, new INativeRouter(){

            @Override
            public void openContainer(Context context, String url, Map<String, Object> urlParams, int requestCode, Map<String, Object> exts) {
                String assembleUrl = Utils.assembleUrl(url, urlParams);
                PageRouter.openPageByUrl(context, assembleUrl, urlParams);
            }
        }).isDebug(true)
                .whenEngineStart(FlutterBoost.ConfigBuilder.ANY_ACTIVITY_CREATED)
                .build();

        FlutterBoost.instance().init(platform);
    }
}