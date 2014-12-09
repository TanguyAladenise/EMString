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


This is a work in progress :)



Notes for myself
=
Explain customization and versatility.
Explain advantages (localization purposes)

