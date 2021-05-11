import ScadeKit

extension MainPageAdapter {
  var rowView1: SCDWidgetsRowView {
    return self.page?.getWidgetByName("rowView1") as! SCDWidgetsRowView
  }

  var playStopButton: SCDWidgetsButton {
    return self.page?.getWidgetByName("playStopButton") as! SCDWidgetsButton
  }

  var rowView2: SCDWidgetsRowView {
    return self.page?.getWidgetByName("rowView2") as! SCDWidgetsRowView
  }

  var lblPlayPosition: SCDWidgetsLabel {
    return self.page?.getWidgetByName("lblPlayPosition") as! SCDWidgetsLabel
  }

  var sldrPosition: SCDWidgetsSliderLine {
    return self.page?.getWidgetByName("sldrPosition") as! SCDWidgetsSliderLine
  }

  var rowView3: SCDWidgetsRowView {
    return self.page?.getWidgetByName("rowView3") as! SCDWidgetsRowView
  }

  var sliderLine2: SCDWidgetsSliderLine {
    return self.page?.getWidgetByName("sliderLine2") as! SCDWidgetsSliderLine
  }

  var button1: SCDWidgetsButton {
    return self.page?.getWidgetByName("button1") as! SCDWidgetsButton
  }

  var button2: SCDWidgetsButton {
    return self.page?.getWidgetByName("button2") as! SCDWidgetsButton
  }
}