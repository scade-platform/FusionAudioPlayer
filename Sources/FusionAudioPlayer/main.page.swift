import Foundation
import ScadeKit
import ScadeExtensions
import FusionMedia

extension SCDWidgetsSliderLine {

  func onSlide(closure: @escaping (SCDWidgetsSliderLineEvent?) -> Void) {
    self.onSlide.append(SCDWidgetsSliderLineEventHandler(closure))
  }
}

class MainPageAdapter: SCDLatticePageAdapter {

  var player: FusionMedia.AudioPlayer? 
  let playImage = "./Assets/play1.svg"
  let stopImage = "./Assets/stop1.svg"

  let maxVolume = 100
  var duration: Double = 180

  var isPlaying = true
  var timer:Timer!
//  var dateComponent = DateComponentsFormatter()

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

	//setup player
    self.player = FusionMedia.AudioPlayer(url: URL(forResource: "Assets/Ketsa-Good_Vibe.mp3"))
    
	// setup seek slider
	if let player = self.player {
	  duration = player.getDuration()
      self.sldrPosition.maxValue = Int(duration)
	}

    self.sldrPosition.onSlide { e in self.onPositionChanged(ev: e) }
    
    // setup volume slider
    self.sldrVolume.maxValue = maxVolume
 	if let player = self.player {
      self.sldrVolume.position = Int(player.getVolume() * Float(maxVolume))
    }
	self.sldrVolume.onSlide { e in self.onVolumeChanged(ev: e) }
	
	// setup stop/play button
    self.playStopButton.onClick { _ in self.playStopButtonClicked() }

	// configure date component
//    self.dateComponent.allowedUnits = [.minute, .second]
//    self.dateComponent.unitsStyle = .positional
//	self.dateComponent.zeroFormattingBehavior = .pad
  }

  func onPositionChanged(ev: SCDWidgetsSliderLineEvent?) {
    let sliderPosition = Double(ev!.newValue)

//    if let sliderPositionMinutesSeconds = self.dateComponent.string(from: sliderPosition) {
//     self.lblPlayPosition.text = sliderPositionMinutesSeconds
//    }
	player?.setProgress(Float(sliderPosition / self.duration))
  }

  func onVolumeChanged(ev: SCDWidgetsSliderLineEvent?) {
    let sliderPosition = ev!.newValue

	player?.setVolume(Float(sliderPosition) / Float(self.maxVolume))
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
	isPlaying ? self.player?.stop() : self.player?.play()
	
	guard let player = player else { return }
	timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
        self.sldrPosition.position = Int(Double(player.getProgress()) * self.duration)
        if !player.isPlaying() {
            timer.invalidate()
        }
	}
  }

}
