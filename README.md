# Renetik iOS Layout

## About
Write complex reliable layouts easy, 
by using declarative readable syntax and pure code approach. 
This way you never has to rewrite your layout again using other whatever way to do it. 
Its always compatible because it is based on basic UIKit underlying technology. 
You don't need to learn new artificial paradigms to solve the same puzzle 
by different methods all over again, 
just get better in real programming and focus on your task, 
not new ways of doing things that distract you from making great products.

## Example

<p align="left">
    <img src="https://github.com/renetik/renetik-ios-layout/blob/4ab8be927dd354bbea8dc3a6af8fc6be53c5770b/Images/Simulator2.png?raw=true" height="500">
    <img src="https://github.com/renetik/renetik-ios-layout/blob/4ab8be927dd354bbea8dc3a6af8fc6be53c5770b/Images/Simulator1.png?raw=true" width="500">
</p>

```swift
import RenetikLayout

class MainView: CSView {
    override func onCreateLayout() {
        super.onCreateLayout()
        background(.demo_panel)
        add(view: CSView.construct(), onCreate: {
            $0.matchParentWidth()
            $0.add(view: SwitchButton.construct(icon: .chevron_right, title: "test"))
                .matchParentWidth()
                .background(.demo_control).heightToFit()
            
            $0.add(view: ImageTitleSubtitleButton.construct(), onCreate: {
                $0.matchParentWidth().heightToFit().background(.demo_control)
            }, onLayout: {
                $0.fromPrevious(top: 15)
            })
        }, onLayout: {
            $0.heightToFit().centeredVertical()
        })
        //        debugLayoutByRandomBackgroundColor()
    }
}
```

## Demo
To run the example project, clone the repo and open Demo project.

## Requirements
Open and clear mind.

## Installation
You can install using swift package manager for now using latest released version.

## Author
Renetik, [Website](https://rene-dohan.github.io)

## License
Renetik Layout is available under the MIT license. See the LICENSE file for more info.
