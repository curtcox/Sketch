import UIKit

class ViewController: UIViewController {
    
    override func loadView() {
        view = SketchView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRecognizers()
    }
    
    func playPause() {
        displayPaused()
    }
    
    func displayPaused() {
        displayText("Paused")
    }
    
    func afterDelay(ti: NSTimeInterval, selector: Selector) {
        NSTimer.scheduledTimerWithTimeInterval(ti, target: self, selector: selector, userInfo: nil, repeats: false)
    }
    
    // view
    func strobeView() -> SketchView {
        return view as! SketchView
    }
    
    func displayText(text: String) {
        strobeView().displayText(text)
    }
    
    func addRecognizers() {
        addPlayPauseRecognizer()
    }
    
    func addPlayPauseRecognizer() {
        addRecognizerToView(UIPressType.PlayPause, action: "playPause")
    }
    
    func addRecognizerToView(pressType:UIPressType, action:Selector) {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: action)
        tapRecognizer.allowedPressTypes = [NSNumber(integer: pressType.rawValue)];
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    override func pressesBegan(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        log(presses, withEvent:event);
    }
    
    override func pressesEnded(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        log(presses, withEvent:event);
    }
    
    override func pressesChanged(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        log(presses, withEvent:event);
    }
    
    override func pressesCancelled(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        log(presses, withEvent:event);
    }

    func log(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        NSLog("pressesCancelled presses=%@ event=%@",presses,event!);
    }

}

