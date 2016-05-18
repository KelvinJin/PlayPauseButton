PlayPauseButton
===============

Animated Play &amp; Pause Button, subclass of UIButton written in Swift

<img src="https://raw.githubusercontent.com/KelvinJin/PlayPauseButton/master/loopdemo.gif" alt="PlayPauseButton" style="max-width:50%">

**How to use**
```swift
// Initial the button with a particular frame
self.button = PlayPauseButton(frame: CGRectMake(0, 0, 50, 50))

// Add actions
self.button.addTarget(self, action: "toggle:", forControlEvents:.TouchUpInside)

// In the toggle function:
func toggle(sender: AnyObject!) {
	self.button.showsMenu = !self.button.showsMenu
}
```

**Customize**
```swift
// Set the stroke color
self.button.strokeColor = UIColor.blueColor().CGColor

// Set the duration time
self.button.duration = 0.5

// Set the fill color
self.button.fillColor = UIColor.redColor().CGColor

// Set the line width
self.button.lineWidth = 2.5
```

Credit
===============
This project is highly inspired by [Robert Böhnke](http://robb.is/working-on/a-hamburger-button-transition/)
And [CreativeDash team](https://dribbble.com/Creativedash)
