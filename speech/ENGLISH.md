## 02 - Prior to Flutter

Before we start to have a look of Flutter, let’s see the current app mobile development situation.

If we want to build an app, we can either go native or choose a cross platform development.

With the native approach we need to know Java/Kotlin for Android and Swift/C++ for iOS, we do have good performance but we probably need two developers or team to handle all native development.

However at the end we might also have a different result between iOS and Android due to the different native components.

On the other hand, the cross-platform development, using for example Xamarin, React Native or Native Script, we can have a faster development cycle, one code base to reuse between iOS and Android but at a cost: performance.

Although lately react native improved a lot, it still has issues with performance, especially in animation, shadows and gradient.

User interaction such as scrolling, touch, input etc, still have some drawbacks since they are all mapped to the corresponding native component, that will lead to unpredictable behaviors and latency due to the JavaScript bridge.

## 03 - An real world example

For example, our designers come up with a fancy design for our app, when we developing it, we finding it faster and safer to use existing native components.

If we need to build our own, it might takes too much time and the performances might not match the requirements

Ultimately Android and iOS are not the same so we always need to do some tricks to achieve the end result.

Story short we always need to do some compromise, and the shipped app might look different from the original design.

## 04 - How Flutter changed that

Flutter changed this in a radical way, it took the best of both world.

It took every single user event, ui, behavior and components and turn it in a so called widgets,

With this Widgets we are able to draw every single pixel on the screen, both on iOS and Android, without using the native components like View, TextInput, ScrollView, etc

And to make it easy for developers it ship with all the tools, from compiling to native code, debugging and release the app.

## 05 - What is Flutter?

So what is Flutter?

- Is a new approach to the cross platform problem,
- is made by Google and it allow to build 2D native apps, and even 2D games

Flutter is mainly composed of three parts:

- the Framework: to handle all the app logic and rendering instruction, built on Dart,
- the Engine, to handle graphics and text rendering, built in C++,
- and the Tooling for development and production, a really fast (and reliable) hot reload

## 06 - Flutter allow you to build beautiful UI

Those are some examples of app build with Flutter. To notice is the complex animation and UI effects, that now days are difficult to achieve with other cross platform framework like React Native.

## 07 - Flutter ecosystem

The low level part of Flutter, is the engine. written in C++, it uses a SKIA, a 2D graphics rendering library to tell the GPU how to render the graphics and text, basically how to paint every pixel on the display.

We also have a Dart virtual machine, to run the compiled framework and app, ether in AOT for production or JIT for development

Then we have the framework itself that is completely written in dart, this is where all the widgets and app logics is located.

On top of that we have the packages and plugins for interact with the native platform functionality like GPS, battery, Bluetooth, etc

And then we have the Tooling for development, debugging and production.

One more things, the flutter engine also include platform specific code, iOs and Android, to handle the communication with the underline system. This part is called Embedders, we will get back to this later.

## 08 - What are Widgets

Widgets are the building blocks of a Flutter app.

There like webcomponent, they are small and have a specific function.

Some only contains rendering information (there are called RenderObject) to instruct the lower layer, the engine, how to render the widget.

All of them are based on tree composition, where a widget is the child of another widget, so on so forth,

From adding a Padding, Center a text, make a border radius, or listen to an event, we need a widget and compose it in a tree.

## 09 - What kind of Widgets

There are around 2000+ widgets ready to use inside the Flutter framework.

Some are generic, just handle alignment, border, shadow, gradient etc

Then we have Material widgets, that have the same look and feel of Android native apps, like the Floating Button, TabView, Scrolling, Ripple effect, etc

And recently the Flutter team also add Cupertino, the iOS styles-like widgets, like the ActionSheet, Switch Button, etc.

## 10 - Live Coding Demo

See code in lib folder

## 11 - How Flutter compile the code

So how flutter compile the app and how can we have a fast development environment?

In debug we use Just in Time mode, the dart code is given to the Dart Virtual Machine as it is.

For production we use Ahead of Time mode, and the dart code is first compile it and then pass down to the Dart runtime for a fast execution.

This allows Flutter to communicate with the platform without going through a JavaScript bridge.

## 12 - Engine details

We talk before about the flutter engine, let’s now go a bit deeper.

The engine job is to prepare all the instruction for the rendering phase and receive the user inputs, but we have also another layer underneath

This layer is called Embedder API, is where all the app threads are running and where we deal with the handling of touch/mouse/keyboard input, etc.

The flutter engine include 2 embedders out of the box, the android and ios one, but it also include a set of API to allow custom embedders.

## 13 - Embedders Threads

The Flutter engine require 4 threads or task runner, but is the Embedder job to create it and provide it to the engine.

## 14 - Flutter Embedders

Thanks to the embeddeds we have the possibility to run flutter on virtually any platform

As today, we have embedders also for desktop, Mac, Windows and Linux.

An experimental embedder for the Web, a project called Hummingbird.

And some experiment on Raspberry and Android Things
