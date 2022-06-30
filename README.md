[![Xcode - Build Analyze](https://github.com/renetik/renetik-ios-layout/actions/workflows/build_analyze.yml/badge.svg)
](https://github.com/renetik/renetik-ios-layout/actions/workflows/build_analyze.yml)
# Renetik iOS - Layout
#### [https://github.com/renetik/renetik-ios-layout](https://github.com/renetik/renetik-ios-layout/)
#### [Documentation](https://renetik.github.io/renetik-ios-layout/)
Framework to enjoy, improve and speed up your application development while writing readable code.
Used as library in many projects and improving it while developing new projects.
I am open for [Hire](https://renetik.github.io) or investment in my mobile app music production & perfromance project Renetik Instruments www.renetik.com.

## About
Write complex reliable layouts easy, 
by using declarative readable syntax and pure code approach. 
This way you never has to rewrite your layout again using other whatever way to do it. 
Its always compatible because it is based on basic UIKit underlying technology. 
You don't need to learn new artificial paradigms to solve the same puzzle 
by different methods all over again, 
just get better in real programming and focus on your task, 
not new ways of doing things that distract you from making great products.

## Tested on iOS, MacOS Catalyst

## Basic idea
Is to have functions onCreate and onLayout in parent class as well as in layout code structure so it is well structired and visualy resembles structure of actual layout. Other is to use fuctions like from(top:.. matchParentWidth(padding:..) flex(right:.. heightToFit() and others that gives you tools to create any layout you imgine easily. This all is just basic UIKit staf. 
Then there is updateLayout(forced:Bool that do update of layout or also all parent views, its also important yo use CSSceneDelgate as it calls updateLayout for some views on orientation change what is necessary in some cases.. 
Otherwise I believe performance wise this library is best you can get, but stil can be improved potentialy but I didnt focused on that much yet.

## Example
<p align="left">
    <img src="https://github.com/renetik/renetik-ios-layout/blob/4ab8be927dd354bbea8dc3a6af8fc6be53c5770b/Images/Simulator2.png?raw=true" height="500">
    <img src="https://github.com/renetik/renetik-ios-layout/blob/4ab8be927dd354bbea8dc3a6af8fc6be53c5770b/Images/Simulator1.png?raw=true" width="500">
</p>

Readability and simplicity of approach are the solutions for maintainable code base. Using SwiftUI preview opened new previously unimaginable possibilities, where even advanced editor of Android Studio strugles. Write beatiful code while be in control of what is really happening with full access to make any fix necessary easily.

```swift
import RenetikLayout

class HeaderSectionView: CSView {
    override class func construct() -> Self {
        super.construct().background(color: .demo_control)
    }
    let header = wrap(UILabel.construct("App")).styleHeader()
    let buttons = ButtonsView.construct()

    override func onCreate() {
        super.onCreate()
        add(view: header).matchParentWidth().from(top: 0)
        add(view: HorizontalLineStrong.constructMedium())
            .fromPrevious(top: 0).matchParentWidth()
        add(view: buttons).fromPrevious(top: 0).matchParentWidth()
        heightByLastSubview()
    }
}
#if DEBUG
    import SwiftUI
    class AppPreview: PreviewProvider, CSPreviewProvider {
        class func preview(in window: UIView) {
            window.add(view: HeaderSectionView.construct())
                .matchParentWidth().heightToFit()
        }
    }
#endif
```
<p align="center">
    <img src="https://github.com/renetik/renetik-ios-layout/blob/427bdc55b71bc629fe93da856fba5e05d533dcae/Images/Code1.png?raw=true" height="500">
</p>

## Create fully dynamic layouts with simple practices based on fundamental patterns and modern readable clean syntax.
Undelying codebase is easy to read and understand so you dont get lost and can focuse on how layout actually work instead of how library works.

```swift
class ButtonsView: CSView {
    override class func construct() -> Self {
        super.construct().background(color: .demo_control)
    }
    let moveButton = IconTextButton.construct(icon: .open_with, title: "Move")
    let resizeButton = IconTextButton.construct(icon: .fit_screen, title: "Resize")
    let scalesButton = IconTextButton.construct(icon: .aspect_ratio, title: "Scales")
    let typeButton = IconTextButton.construct(icon: .dashboard, title: "Type")

    override func onCreate() {
        super.onCreate()
        add(view: CSView.construct(),
            onCreate: { [unowned self] in
                $0.fromPrevious(top: 0).matchParentWidth().height(60)
                $0.add(view: moveButton,
                    onCreate: { $0.from(left: 0).matchParentHeight() },
                    onLayout: { $0.width($0.superview!.width / 2) })
                $0.add(view: VerticalLine.constructMedium(),
                    onCreate: { $0.matchParentHeight() },
                    onLayout: { $0.fromPrevious(left: 0) })
                $0.add(view: resizeButton,
                    onCreate: { $0.matchParentHeight() },
                    onLayout: { $0.fromPrevious(left: 0).width($0.superview!.width / 2) })
            })
        add(view: HorizontalLineStrong.constructMedium())
            .fromPrevious(top: 0).matchParentWidth()
        add(view: CSView.construct(),
            onCreate: { [unowned self] in
                $0.fromPrevious(top: 0).matchParentWidth().height(60)
                $0.add(view: scalesButton,
                    onCreate: { $0.from(left: 0).matchParentHeight() },
                    onLayout: { $0.width($0.superview!.width / 2) })
                $0.add(view: VerticalLine.constructMedium(),
                    onCreate: { $0.matchParentHeight() },
                    onLayout: { $0.fromPrevious(left: 0) })
                $0.add(view: typeButton,
                    onCreate: { $0.matchParentHeight() },
                    onLayout: { $0.fromPrevious(left: 0).fill(right: 0) })
            })
        heightByLastSubview()
    }
}
```
<p align="center">
    <img src="https://github.com/renetik/renetik-ios-layout/blob/master/Images/Code3.png?raw=true" height="500">
</p>

## Demo
To run the example project, clone the repo and open Demo project. It is demonstration of some of best approaches I use in iOS development, but more will come in other libraries.

## Requirements
Open and clear mind.

## Installation
You can install using swift package manager for now using latest released version or master.

## Usage
Look at usage in demo application or [Documentation](https://renetik.github.io/renetik-ios-layout/) that will be hopefully documented better soon, 
but don't hesitate to look at actual implementation, because it's always as simple as possible, names are always descriptive,
and syntax is always readable, because I do just that, I remeber a little and have to understand it quickly from codebase again.

## Author
Renetik, [Website](https://renetik.github.io)

## Hire me ! or check out [Renetik Instruments](https://renetik.com)

## License
Renetik Layout is available under the MIT license. See the LICENSE file for more info.
