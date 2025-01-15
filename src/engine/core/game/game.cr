class Game

    def input(input : Event::Input)
        if input.get_key(Event::Key::W)
            puts "Up"
        elsif input.get_key(Event::Key::S)
            puts "Down"
        elsif input.get_key(Event::Key::A)
            puts "Left"
        elsif input.get_key(Event::Key::D)
            puts "Right"
        elsif input.get_key(Event::Key::Space)
            puts "Jump"
        end

        if input.get_mouse(Event::MouseButton::Left)
            puts "Left click on #{input.get_mouse_pos}"
        end
    end

    def update
    end

    def render
    end

end
