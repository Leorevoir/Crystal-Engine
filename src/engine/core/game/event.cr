module Event

    class Input

        alias Key = Event::Key
        alias MouseButton = Event::MouseButton

        @last_key = {} of Key => Bool
        @last_mouse = {} of MouseButton => Bool

        def initialize(@window : Window)
        end

        ####################################################################
        # update mouse and key inputs
        def update
            Key.each { |k| @last_key[k] = get_key(k) }
            MouseButton.each { |b| @last_mouse[b] = get_mouse(b) }
        end

        ####################################################################
        # check if key is pressed on the @window
        # TODO: check for key_released
        def get_key(key : Key) : Bool
            @window.key_pressed?(key.as(Key))
        end

        ####################################################################
        # check if mouse button is pressed on the @window
        # TODO: check for mouse_released
        def get_mouse(button : MouseButton) : Bool
            @window.mouse_pressed?(button.as(MouseButton))
        end

        ####################################################################
        # returns the a Vector2f of the current mouse position on the @window
        # Vector2f is a NamedTuple of two Float64
        # v.x and v.y
        def get_mouse_pos : Vector2f
            x = 0f64
            y = 0f64
            LibGLFW.get_cursor_pos(@window.window, pointerof(x), pointerof(y))
            Vector2f.new(x: x, y: y)
        end

    end

end
