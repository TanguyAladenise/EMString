About EMString
===

EMString stands for Easy Markup String. I hesitated to call it SONSAString : Sick Of NSAttributedString...

Even if Apple tried to make it easier for us to work with custom fonts and text styling, it still isn't as convenient as it should be.
Most of the time if you need to display a text with different styling in it, like "<strong>This text is bold</strong> but then <em>italic.</em>", you would use an NSAttributedString and its API. 
Personnaly I don't like it! It clusters my classes with a lot of boiler plate code to find range and apply style, etc... Or even worse you would use two labels but then struggle to make their frame aligned with dymamic text...

This should be an easier task. Like right now when I'm typing this README file. I just naturally wrote :
```
<strong>This text is bold</strong> but then <em>italic.</em>
```
This is what EMString is about. Use the efficient HTML markup system we all know and get an iOS string stylized in one line of code and behave like you would expect it to.

How it works
===

What else but to show you a without/with EMString snippet of code to illustrate the awesomness of EMString?
Lets take our "<strong>This text is bold</strong> but then <em>italic.</em>" example and write it in Objective-c.

<strong>Without EMString</strong>
```objc
NSString *myString = @"This text is bold but then italic.";
NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:myString];
[attributedString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:16] range:[myString rangeOfString:@"This text is bold"]];
[attributedString addAttribute:NSFontAttributeName value:[UIFont italicSystemFontOfSize:16] range:[myString rangeOfString:@"italic."]];

myLabel.attributedText = attributedString;
```

<strong>With EMString</strong>
```objc
myLabel.attributedText = @"<strong>This text is bold</strong> but then <em>italic.</em>".attributedString;
```

Do I need to say more? :)

Installation
===

I still haven't setup the cocoapod for this repository, but if you want to start using EMString, download the archive and import the EMString folder in your Xcode project.

Customization's magic
===

If we talk about styling text then we talk about customization and versatility. 
EMString gives you precisely that.
Firstly, it comes with a set of default markup:
<ul><li>strong</li><li>em</li><li>p</li><li>u</li><li>s</li><li>and headings h1,h2,...,h6</li></ul>

Those markup can be easily customized to fit your need.
Basically you can set for each of those pre-defined markup:
<ul><li>A specific font</li><li>A specific color</li><li>A display rule (inline/block)</li></ul>

To apply a style you have to modify properties of <code>EMStringStylingConfiguration</code>

For example I will change the h1 and strong markup behavior:

```objc
// Change h1 font
[EMStringStylingConfiguration sharedInstance].h1Font = [UIFont fontWithName:@"OpenSans" size:26];
// Change h1 color
[EMStringStylingConfiguration sharedInstance].h1Color = [UIColor blueColor];
// Change strong font
[EMStringStylingConfiguration sharedInstance].strongFont = [UIFont fontWithName:@"OpenSans-Bold" size:fontSize];
```

Also if you have a default color and/or font for your whole app you can use those two convenient properties.
```objc
@property (strong, nonatomic) UIFont *defaultFont;

@property (strong, nonatomic) UIColor *defaultColor;
```

Secondly, what if you need your own markup? Well EMString make it simple once again.
Use the convenient <code>EMStylingClass</code> object to create a custom class:

```objc
EMStylingClass *aStylingClass = [[EMStylingClass alloc] initWithMarkup:@"<customMarkup>"];
[aStylingClass setColor:[UIColor blueColor]];
[aStylingClass setFont:[UIFont fontWithName:@"OpenSans" size:16]];
// You can use the attributes property for full control
// aStylingClass.attributes = @{};
[[EMStringStylingConfiguration sharedInstance] addNewStylingClass:aStylingClass];
```

Since <code>EMStringStylingConfiguration.h</code> is a singleton you don't have to do this everytime. Only once, to setup your styling need. After that, all call to .attributedString will give you the NSAttributedString properly styled.
This will help you to be consistent in your design as well.

For a better idea of all you can do I suggest you take a look at the header files <code>EMStringStylingConfiguration.h</code> and <code>EMStylingClass.h</code>.


Update readme with
=
Installation cocoapods
Explain advantages (localization purposes)

