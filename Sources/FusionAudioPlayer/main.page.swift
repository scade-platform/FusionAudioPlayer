import Foundation
import ScadeKit

extension SCDWidgetsSliderLine {

  func onSlide(closure: @escaping (SCDWidgetsSliderLineEvent?) -> Void) {
    self.onSlide.append(SCDWidgetsSliderLineEventHandler(closure))
  }
}

class MainPageAdapter: SCDLatticePageAdapter {

  let playImage = "./Assets/play1.svg"
  let stopImage = "./Assets/stop1.svg"

  var duration: Double = 180

  var isPlaying = true
  var dateComponent = DateComponentsFormatter()

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

	// setup slider
    self.sldrPosition.maxValue = Int(duration)
    self.sldrPosition.onSlide { e in self.onPositionChanged(ev: e) }

	// setup stop/play button
    self.playStopButton.onClick { _ in self.playStopButtonClicked() }

	// configure date component
    self.dateComponent.allowedUnits = [.minute, .second]
    self.dateComponent.unitsStyle = .positional
	self.dateComponent.zeroFormattingBehavior = .pad

  }

  func onPositionChanged(ev: SCDWidgetsSliderLineEvent?) {
    let sliderPosition = Double(ev!.newValue)

    if let sliderPositionMinutesSeconds = self.dateComponent.string(from: sliderPosition) {
     self.lblPlayPosition.text = sliderPositionMinutesSeconds
    }

  }

  func canChangeState() -> Bool {
    return true
  }

  func playStopButtonClicked() {

    if !canChangeState() {
      return
    }

    // toggle state and change button accordingly
    self.isPlaying = !self.isPlaying
    let imageUrl = isPlaying ? playImage : stopImage
    self.playStopButton.url = imageUrl
    
  }

}
