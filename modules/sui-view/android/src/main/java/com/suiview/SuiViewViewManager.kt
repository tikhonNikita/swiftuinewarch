package com.suiview

import android.graphics.Color
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.ViewManagerDelegate
import com.facebook.react.uimanager.annotations.ReactProp
import com.facebook.react.viewmanagers.SuiViewViewManagerInterface
import com.facebook.react.viewmanagers.SuiViewViewManagerDelegate

@ReactModule(name = SuiViewViewManager.NAME)
class SuiViewViewManager : SimpleViewManager<SuiViewView>(),
  SuiViewViewManagerInterface<SuiViewView> {
  private val mDelegate: ViewManagerDelegate<SuiViewView>

  init {
    mDelegate = SuiViewViewManagerDelegate(this)
  }

  override fun getDelegate(): ViewManagerDelegate<SuiViewView>? {
    return mDelegate
  }

  override fun getName(): String {
    return NAME
  }

  public override fun createViewInstance(context: ThemedReactContext): SuiViewView {
    return SuiViewView(context)
  }

  @ReactProp(name = "color")
  override fun setColor(view: SuiViewView?, color: String?) {
    view?.setBackgroundColor(Color.parseColor(color))
  }

  companion object {
    const val NAME = "SuiViewView"
  }
}
