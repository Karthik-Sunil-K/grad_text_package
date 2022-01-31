# grad_text

A Flutter Widget to draw gradients into text.(Null safe)

# Demo

<img src="https://user-images.githubusercontent.com/62179996/151789079-352c06b6-c9be-4788-97bb-fffb70fa0750.png" width="40%" align="left" padding='50'/>


# Install

Add the plugin

```yaml
dependencies:
  ...
  grad_text: ^0.0.3
```

# Usage

```dart
import 'package:grad_text/grad_text.dart';
```

Use it:

```dart
GradientText(
    text: 'My Name is Karthik',
    colors: <Color>[
        Colors.deepOrange,
        Colors.yellow
    ],
    style: TextStyle(fontSize: 30.0),
);
```

# Parameters

| Parameter 	| Required 	| Description 	|
|-	|-	|-	|
| text 	| true 	| Text to show. 	|
| colors 	| true 	| List of colors to apply. 	|
| style 	| false 	| Text style. 	|
| overflow 	| false 	| How visual overflow should be handled. 	|
| textAlign 	| false 	| How the text should be aligned horizontally. 	|
| tileMode 	| false 	| Defines what happens at the edge of the gradient. 	|
| customGradient 	| false 	| Use a custom gradient. This will override the **type** following parameters: **type**, **colors**, **transform** and **tileMode**. 	|
| gradientDirection 	| false 	| Set gradient direction. Possible values: **rtl** (Right to left), **ltr** (Left to right), **ttb** (Top to bottom), **btt** (Bottom to top) 	|
| transform 	| false 	| Used for transforming gradient shaders without applying the same transform to the entire canvas. 	|
| type 	| false 	| Set gradient type. Possible values: **linear** and **radial** 	|	
