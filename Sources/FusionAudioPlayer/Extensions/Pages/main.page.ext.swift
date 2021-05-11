import ScadeKit

extension MainPageAdapter {
  var rowView1: SCDWidgetsRowView {
    return self.page?.getWidgetByName("rowView1") as! SCDWidgetsRowView
  }

  var image2: SCDWidgetsImage {
    return self.page?.getWidgetByName("image2") as! SCDWidgetsImage
  }

  var image3: SCDWidgetsImage {
    return self.page?.getWidgetByName("image3") as! SCDWidgetsImage
  }

  var sliderLine1: SCDWidgetsSliderLine {
    return self.page?.getWidgetByName("sliderLine1") as! SCDWidgetsSliderLine
  }

  var playStopButton: SCDWidgetsImage {
    return self.page?.getWidgetByName("playStopButton") as! SCDWidgetsImage
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
}