
	 __  __ __  __  __ _ __  __ __  __  ______ ____
	|  \/  |  \ \ \/ /| |  \/  |  \ \ \/ /    |  __|
	| \  / |   \ \  / | | \  / |   \ \  /| || |  _|
	| |\/| | |\ \/  \ | | |\/| | |\ \/  \| || | |
	|_|  |_|_| \_\/\_\|_|_|  |_|_| \_\/\_\____|_|


# CustomTransition
\\\\\ Custom transitions between UIViewControllers in Swift /////

There are a lot of ways to transition between controllers but I think this is the cleanest (:
This is just a small class to understand how to transition between two UIViewControllers without segues.

How to use: 
When you are ready to switch, call {

#     CustomTransition.coverFromRight(from: self, to: newViewController)

There are many animations already available:

- coverFromRight()	 - - - bring a controller from the right by covering the current one
- uncoverFromRight()	 - - - return from the coverFromRight
- coverFromBottom()	 - - - bring a controller from the bottom by covering the current one
- switchVC()		 - - - entirely switch root controller


Have a look around, once you grasp how this works you can create your own transitions.

NOTE: If you want your old controller to be visible underneath 
	- make sure the presentation style of the new controller is Over FullScreen
