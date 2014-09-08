# Cocos2d-x Programmers Guide
## C++ and Lua

## Table Of Contents

1. About Cocos2d-x
    * A very brief history
        * launched in July 2010, cocos2d-x is the best open-source game engine available. 
        * Versioning information (i.e C++, JS, Lua, not related to Cocos2d-iphone, etc)
         * cocos2d-x comes in a variety of flavors
             * c++[c++](http://www.cocos2d-x.org/products#cocos2dx)
		     * Lua[Lua](http://www.cocos2d-x.org/products#cocos2dx-lua)
    *  Prerequisites
	      * Operating systems and tools supported
	          * For Android development
	          * For iOS and OSX development
	          * For Linux development
	          * For Windows and Windows Phone development 
    * Why choose Cocos2d-x vs other game engines
    * Where to get help
         * [Official Forums](http://http://discuss.cocos2d-x.org)
 
2. Basic Copncepts
 
3. Jumping into Cocos2d-x (We are building a simple game, no explanation)
    * Installation - See appropriate Appendix
    * Getting Started
    * Creating Your First Scene
    * Adding Content to the Scene
    * Using Actions to Animate Scenes
    * Transitioning Between Scenes
    * Building Complex Content Using Nodes
    * Creating Nodes That Interact with Each Other

4. Sprite and Nodes
    * What are Sprites
    * Creating Sprites     
        * Creating a Textured Sprite
        * Creating an Untextured Sprite
        * Creating a Sprite From a SpriteFrame
        * Creating a Sprite From SpriteCache
        * Creating a Sprite From a Rect
    * Sprite Manipulation
        * Resizing
        * Anchor Point and Position    
    * SpriteSheets
    
5. Actions To Nodes
    * What are Basic Actions
        * Animate
        * Fade In/Out
        * Move
        * Rotate
        * Scale
        * Tint
        * Tweening and Easing
    * What are Sequences
        * Spawn
        * Reverse    
    * Running Actions and Sequences

6. Building and Transitioning Scenes
    * What is a Scene?
    * Creating a Scene
        * Creating a Node Tree
        * Node properties to its descendants
    * Coordinate Systems
        * Converting between coordinate systems
    * Transitioning between Scenes

7. UI
    * Labels
         * BMFont
         * TTF
         * Label Atlas
         * SystemFont
    * Label examples
    * Menu/Menu Items
        * What makes up a menu
        * Menu Items and adding to a Menu
        * Examples
             * create Menu with 1 item.
             * create Menu from array of items
             * Lambdas
    * Buttons
    * Scroll
    * Layout
    
8. Other Node Types
    * TMX
    * Particle
    * Parallax
    * Video
   
9. Event Dispatcher
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

10. 3D
    * 3D Sprite
    * 3D Actions
    * 3D Animations
    * Placeholders for: Lights, Shadows, Cameras

11. Lua
    * call custom c++ from Lua
    * bindings to c++
    * subclassing
    * Placeholders for: memory management, Debug a Lua Game

12. Services
    * other SDK's
    * Plugin-X
    * Placeholders - IAP, FB
    
13. Physics
    * What options and why integrated physics engine
    * Physics concepts
    * Physics world, bodies
    * Collision
    * Examples

14. Advanced Topics
    * Best Practice - optimization, memory, performance, profiling
    * Sound
    * SQLite
    * Subclass Cocos2d-x classes
    * Data structures (i.e Vector)
    * Custom OpenGL and Shaders (what to cover here? CustomCommand?)
    * c++11 usage
    * rendering pipeline (notes about this in the wiki)
    * networking - curl, http
    * ccConfig.h (include and the defines that you can enable for debugging memory leaks, drawing, etc.)
    * file system access
    * resolution independence
