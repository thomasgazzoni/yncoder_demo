## 02 - Prior to Flutter

在我们对 Flutter 一探究竟之前，首先来看看今天的手机应用开发情况是怎么样的。

如果我们想生成一个手机应用，我们可以写原生代码或者选择一个跨平台开发。

如果写原生的代码在安卓里可以用 Java 或 Kotlin，在 iOS 里可以用 Swift 或 C++，应用的确可以有不错的性能，但是很可能我们需要两个或者两组团队的程序员来应付所有的原生代码。

而且到最后很可能我们因为使用了不同的原生组件在 iOS 和安卓系统里会呈现出不一样的结果。

另一方面，跨平台开发使用例如 Xamarin，React Native 或者 Native Script， 我们可以有更短的开发周期 和 两个平台使用同一个代码仓库， 但是，代码在两个系统中重复使用
的，代价就是-------性能大大的下降了。

比如 React Native，虽然最近优化了很多但是在性能方面仍然有很多问题，尤其是在 Animations, Shadows 和 Gradients 上。

用户交互中的滚动（scrolling）和输入框仍然有一些缺陷，因为它们全部映射到了对应的原生组件中，而这会导致
JavaScript Bridge 出现不确定的行为和延迟。

## 03 - An real world example

举个例子，我们的设计师为应用想到了一个非常复杂又漂亮的设计，当我们在开发的时候会发现，用原有的原生组件能更快更安全。

因为如果我们建立自己的组件可能会花费很长的时间，而且性能也未必能达到要求。

最后，安卓和 iOS 是不完全一样，我们需要一些小技巧来达到最终的效果。

简单来说，我们总是需要一些妥协，最终发布的应用可能会和开始的设计有所区别。

你门有没有遇到这个问题？我老是有。

## 04 - How Flutter changed that

Flutter 从根本上改变了这个问题，它同时具备了原生代码和跨平台开发两者的优点。

这个技术使得每个独立的 Events, UI, Behaviors, Components 统一成 Flutter 的组件叫 Widgets。

运用 Widgets 我们可以在手机系统里把每一个像素画在屏幕上，而不需要使用到原生 UI 组件比如 RTCView/UIView, TextInput, ScrollView, 等等。

从编译到原生代码，再到调试最后到应用的发布，Flutter 提供了所有需要的工具，使开发工作变得更简单。

## 05 - What is Flutter?

所以 Flutter 是什么?

- 跨平台问题新的解决办法。
- Google 开发的。
- 生成 2D 原生应用，包括 2D 游戏。

Flutter 主要由 3 个部分组成：

- 框架：用 Dart 写的，处理所有应用的逻辑和渲染指令。
- 引擎：用 C++写的，处理图形和文本渲染。
- 开发和生产的工具：一个真正快捷可靠的 Hot Reload。

## 06 - Flutter allow you to build beautiful UI

Flutter 帮助我们实现漂亮又复杂的应用设计

## 07 - Flutter ecosystem

低级别的 Flutter, 它的引擎是由 C++书写的，它使用了一个 2D 图形渲染库，叫 SKIA，告诉 GPU 怎么渲染图形和文本，安排每一个像素如何打在屏幕上。

在引擎里也有一个 Dart 的虚拟机去运行编译的框架和应用代码。

然后我们就有了一个完全用 Dart 写成的框架，定位所有的 Widgets， 动画，RenderObject，等等。

再此之上，我们有 Packages 和 Plugins 让原生平台功能，比如 GPS，蓝牙，电量， 等等 相互作用。

然后我们有开发、调试、生产打包所需要的工具，包括 flutter cli 和 dart package management，叫 pub。
只要下载了，全部都在 Flutter 环境里面。

另外，Flutter 的引擎并不只针对某个特定的平台，它不仅支持安卓和 IOS ，同时也可以通过自定义 Embedder（嵌入器）支持其他平台，待会儿我会详细的解说。

## 08 - What are Widgets

Widgets 是 Flutter 应用的建筑模块。

它们和 web 组件类似，小并且有特定的功能。

一些 Widget 就包含了渲染信息比如 Opacity（不透明）， 阴影， 等等（这些叫 RenderObject Widgets）去命令低级的层级怎么渲染图形。

所有的 Widgets 都基于树形结构，一个 Widget 为另一个 Widgets 的子组件，以此类推。

从加入一个内边距，居中一个文本，到做一个 Border Radius 再到监听一个事件，我们都需要把一个 Widget 排列到树形结构中去。

## 09 - What kind of Widgets

有两千多个 Widgets 可以直接运用到 Flutter 的框架里。

一些是通用的，只处理对齐方式，边界，阴影，颜色渐变，等等。

然后我们有了和安卓原生组件相同感觉/外观的 Material 的 widgets，比如 Floating Button, TabView, Ripple Effect （圆圆的波）, 等等。

Material 就是 google 开发的 design specification 方式，典型在安卓里。

最近 Flutter 团队增加了 Cupertino，iOS 风格的原生组件， 比如 ActionSheet、Switch Button， Bounced Scrolling， 等等。

## 10 - Live Coding Demo

See code in lib folder

## 11 - How Flutter compile the code

所以 Flutter 是怎么样编译应用的，又是怎样给我们创造一个更快捷的开发环境的呢。

在调试中，我们使用 Just in Time 模式：Dart 代码直接被给到了 Dart 虚拟机。

在生产中，我们使用 Ahead of Time 模式：Dart 代码首先编译到 原生的 ARM 代码，然后传给了 Dart 运行时做一个快速执行。

这使得 Flutter 不用像在 React Native 中那样，通过 JavaScript Bridge 跟平台交互。

## 12 - Engine details

现在我们来深入了解一下 Flutter 的引擎。

引擎工作就是准备所有的指令给渲染阶段，接收用户的信息，但我们还有下面一个层级。

这个层级叫 Embedder（嵌入器）， 在这里运行所有的应用线程，处理所有的 touch/mouse/keyboard inputs, 等等。

Flutter 引擎包括，可以直接在 ios 和安卓里使用的两个 Embedders，也包括一系列的 API 可以建立自定义 Embedders。

## 13 - Embedders Threads

Flutter 引擎需要四个线程（Task Runner），而线程是有 Embedder 创造和提供给引擎的。

## 14 - Flutter Embedders

多亏了 embedders 我们可以在任何平台上运行 Flutter。

今天，embedders 可以运用到 Desktop，例如 Mac， Windows 和 Linux。

同时，一个实验阶段的 web 端的 embedder 在试运行阶段，项目叫做 Hummingbird。

和另外一些针对 raspberry 和安卓的实验。
