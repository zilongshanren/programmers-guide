# Cocos2d-x Programmers Guide
## C++ version

## Topics 

1. About Cocos2d-x
1.1. A very brief history
1.1.1. launched in July 2010, cocos2d-x is the best open-source game engine available. 
1.2. Versioning information (i.e C++, JS, Lua, not related to Cocos2d-iphone, etc)
1.2.1. cocos2d-x comes in a variety of flavors
1.2.1.1. [c++](http://www.cocos2d-x.org/products#cocos2dx)
1.2.1.2. [JS](http://www.cocos2d-x.org/products#cocos2dx-js)
1.2.1.3. [Lua](http://www.cocos2d-x.org/products#cocos2dx-lua)
1.3. Prerequisites
1.3.1. Operating systems and tools supported
1.3.1.1. For Android development
1.3.1.2. For iOS and OSX development
1.3.1.3. For Linux development
1.3.1.4. For Windows and Windows Phone development 
1.4. Where to get help
1.4.1. [Official Forums](http://http://discuss.cocos2d-x.org)

2. Installation and Setup
2.1. Android (with Terminal and Eclipse)
2.2. iOS
2.3. OS X
2.4. Linux
2.5. Windows
2.6. Windows Phone
2.7. cocos command-line tool overview
2.8. creating a new project, compiling, testing.

3. Director, Caches
3.1. 

4. Node, Scene, Layers
4.1. Understanding Node and Node concepts
4.2. Scene, creating a Scene
4.3. Transitioning Scene
4.4. Layers, creating and working with Layers 

5. Dispatchers
5.1. What is the EventDispatch mechanism?
5.1.1. responds to user events.
5.1.1.1. The basics:
5.1.1.1.1. Event listeners encapsulate your event processing code.
5.1.1.1.2. Event dispatcher notifies listeners of user events.
5.1.1.1.3. Event objects contain information about the events.
5.2. 5 types of event listeners.
5.2.1. `EventListenerTouch` - responds to touch events
5.2.1.1. describe what to override.
5.2.2. `EventListenerKeyboard` - responds to keyboard events
5.2.2.1. describe what to override.
5.2.3. `EventListenerAcceleration` - responds to accelerometer events
5.2.3.1. describe what to override.
5.2.4. `EventListenMouse` - responds to mouse events
5.2.4.1. describe what to override.
5.2.5. `EventListenerCustom` - responds to custom events
5.2.5.1. describe what to override.
5.3. Registering event with the dispatcher
5.4. removing events from the dispatcher

6. Sprites
6.1. Sprite overview
6.2. 2D Sprites, manipulating, textures
6.2.1. various create methods
6.3. 3D Sprites
6.3.1. supported formats
6.3.2. various create methods
6.4. Sprite Sheets and tools
6.4.1. what are sprite sheets
6.4.2. benefits
6.5. Sprite Cache
6.5.1. what is the Sprite Cache
6.5.2. benefits and why use it
6.6. Sprite manipulation - position, size, basic action
6.6.1. position
6.6.2. size
6.6.3. basic actions
6.7. RenderTexture
6.7.1. what is a render texture
6.7.2. how do you use it?

7. Actions, Sequences
7.1. What are Actions?
7.2. Action examples
7.2.1. refer to API docs for complete listing
7.3. What are Sequences
7.4. Sequence examples
7.4.1. refer to API docs for complete listing

8. Menu, MenuItems
8.1. What makes up a menu
8.2. Menu Items and adding to a Menu
8.3. Examples
8.3.1. create Menu with 1 item.
8.3.2. create Menu from array of items
8.3.3. Lambdas

9. Labels
9.1. Available Label types
9.1.1. BMFont
9.1.2. TTF
9.1.3. Label Atlas
9.1.4. SystemFont
9.2. Label examples

10. Physics
10.1. What options and why integrated physics engine
10.2. Physics concepts
10.3. Physics world, bodies
10.4. Collision
10.5. Examples

11. Advanced Topics
11.1. Custom OpenGL (what to cover here? CustomCommand?)
11.2. c++11 usage
11.3. rendering pipeline

12. Misc topics
12.1. Sound
12.2. SQLite
12.3. Subclass Cocos2d-x classes
12.4. Data structures (i.e Vector)


