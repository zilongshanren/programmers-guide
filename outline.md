# Cocos2d-x Programmers Guide
## C++ version

## Topics 

1. About Cocos2d-x
  1. A very brief history
     * launched in July 2010, cocos2d-x is the best open-source game engine available. 
     * Versioning information (i.e C++, JS, Lua, not related to Cocos2d-iphone, etc)
         * cocos2d-x comes in a variety of flavors
             * c++ [c++](http://www.cocos2d-x.org/products#cocos2dx)
             * JS [JS](http://www.cocos2d-x.org/products#cocos2dx-js)
		      * Lua [Lua](http://www.cocos2d-x.org/products#cocos2dx-lua)

  2.  Prerequisites
		* Operating systems and tools supported
	      * For Android development
	      * For iOS and OSX development
	      * For Linux development
	      * For Windows and Windows Phone development 

  3. Where to get help
      * [Official Forums](http://http://discuss.cocos2d-x.org)

2. Director, Caches

3. Node, Scene, Layers
 * Understanding Node and Node concepts
 * Scene, creating a Scene
 * Transitioning Scene
 * Layers, creating and working with Layers 

4. Dispatchers
 * What is the EventDispatch mechanism?
     * responds to user events.
         * The basics:
         * Event listeners encapsulate your event processing code.
         * Event dispatcher notifies listeners of user events.
         * Event objects contain information about the events.
 * 5 types of event listeners.
     * `EventListenerTouch` - responds to touch events
         * describe what to override.
     * `EventListenerKeyboard` - responds to keyboard events
         * describe what to override.
     * `EventListenerAcceleration` - responds to accelerometer events    
         * describe what to override.
     * `EventListenMouse` - responds to mouse events
         * describe what to override.
     * `EventListenerCustom` - responds to custom events   
         * describe what to override.
 * Registering event with the dispatcher
 * Removing events from the dispatcher

5. Sprites
 * Sprite overview
 * 2D Sprites, manipulating, textures
     * various create methods
 * 3D Sprites
     * supported formats
     * various create methods
 * Sprite Sheets and tools
     * what are sprite sheets
     * benefits
 * Sprite Cache
     * what is the Sprite Cache
     * benefits and why use it
 * Sprite manipulation - position, size, basic action
     * position
     * size
     * basic actions
 * RenderTexture
     * what is a render texture
     * how do you use it?

6. Actions, Sequences
 * What are Actions?
    * Action examples
        * refer to API docs for complete listing
 * What are Sequences
    * Sequence examples
        * refer to API docs for complete listing

7. Menu, MenuItems
 * What makes up a menu
 * Menu Items and adding to a Menu
 * Examples
     * create Menu with 1 item.
     * create Menu from array of items
     * Lambdas

8. Labels
 * Available Label types
     * BMFont
     * TTF
     * Label Atlas
     * SystemFont
 * Label examples

9. Physics
 * What options and why integrated physics engine
 * Physics concepts
 * Physics world, bodies
 * Collision
 * Examples

10. Advanced Topics
 * Custom OpenGL (what to cover here? CustomCommand?)
 * c++11 usage
 * rendering pipeline

11. Misc topics
 * Sound
 * SQLite
 * Subclass Cocos2d-x classes
 * Data structures (i.e Vector)

12. Installation and Setup
 * Android (with Terminal and Eclipse)
 * iOS
 * OS X
 * Linux
 * Windows
 * Windows Phone
 * cocos command-line tool overview
 * creating a new project, compiling, testing.

