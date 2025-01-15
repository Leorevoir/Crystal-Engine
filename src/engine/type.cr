####################################################################
# unsigned int
alias U16 = UInt16
alias U32 = UInt32
alias U64 = UInt64
alias U128 = UInt128

####################################################################
# Vector2f
# of 2 float64
struct Vector2f

    getter x : Float64
    getter y : Float64
    protected setter x : Float64
    protected setter y : Float64

    def initialize(@x : Float64, @y : Float64)
    end

    def length : Float64
        Math.sqrt(x * x + y * y)
    end

    def dot(other : Vector2f) : Float64
        x * other.x + y * other.y
    end

    def cross(other : Vector3f) : Float64
        x_ = y * other.z - z * other.y
        y_ = z * other.x - x * other.z
        z_ = x * other.y - y * x

        Vector3f.new(x_, y_, z_)
    end

    def normalize : Vector2f
        vec_len : Float64 = length

        @x /= vec_len
        @y /= vec_len
        return self
    end

    def rotate(angle : Float64) : Vector2f
        rad : Float64 = Maths.to_radians(angle)
        cos : Float64 = Math.cos(rad)
        sin : Float64 = Math.sin(rad)

        Vector2f.new(x * cos - y * sin, x * sin + y * cos)
    end

    def +(other : Vector2f) : Vector2f
        Vector2f.new(x + other.x, y + other.y)
    end

    def +(n : Float64) : Vector2f
        Vector2f.new(x + n, y + n)
    end

    def -(other : Vector2f) : Vector2f
        Vector2f.new(x - other.x, y - other.y)
    end

    def -(n : Float64) : Vector2f
        Vector2f.new(x - n, y - n)
    end

    def *(other : Vector2f) : Vector2f
        Vector2f.new(x * other.x, y * other.y)
    end

    def *(n : Float64) : Vector2f
        Vector2f.new(x * n, y * n)
    end

end

####################################################################
# Vector3f
# of 3 float64
struct Vector3f

    getter x : Float64
    getter y : Float64
    getter z : Float64
    protected setter x : Float64
    protected setter y : Float64
    protected setter z : Float64

    def initialize(@x : Float64, @y : Float64, @z : Float64)
    end

    def length : Float64
        Math.sqrt(x * x + y * y + z * z)
    end

    def dot(other : Vector3f) : Float64
        x * other.x + y * other.y + z * other.z
    end

    def normalize : Vector3f
        vec_len : Float64 = length

        @x /= vec_len
        @y /= vec_len
        @z /= vec_len
        return self
    end

    def rotate : Vector3f
        self
    end

    def +(other : Vector3f) : Vector3f
        Vector3f.new(x + other.x, y + other.y, z + other.z)
    end

    def +(n : Float64) : Vector3f
        Vector3f.new(x + n, y + n, z + n)
    end

    def -(other : Vector3f) : Vector3f
        Vector3f.new(x - other.x, y - other.y, z - other.z)
    end

    def -(n : Float64) : Vector3f
        Vector3f.new(x - n, y - n, z - n)
    end

    def *(other : Vector3f) : Vector3f
        Vector3f.new(x * other.x, y * other.y, z * other.z)
    end

    def *(n : Float64) : Vector3f
        Vector3f.new(x * n, y * n, z * n)
    end

end

####################################################################
# events types
module Event

    ####################################################################
    # key enum
    # inspiration: CrystGLFW enum type on https://github.com/calebuharrison/CrystGLFW
    enum Key
        Unknown       = LibGLFW::KEY_UNKNOWN
        Space         = LibGLFW::KEY_SPACE
        Apostrophe    = LibGLFW::KEY_APOSTROPHE
        Comma         = LibGLFW::KEY_COMMA
        Minus         = LibGLFW::KEY_MINUS
        Period        = LibGLFW::KEY_PERIOD
        Slash         = LibGLFW::KEY_SLASH
        Zero          = LibGLFW::KEY_0
        One           = LibGLFW::KEY_1
        Two           = LibGLFW::KEY_2
        Three         = LibGLFW::KEY_3
        Four          = LibGLFW::KEY_4
        Five          = LibGLFW::KEY_5
        Six           = LibGLFW::KEY_6
        Seven         = LibGLFW::KEY_7
        Eight         = LibGLFW::KEY_8
        Nine          = LibGLFW::KEY_9
        Semicolon     = LibGLFW::KEY_SEMICOLON
        Equal         = LibGLFW::KEY_EQUAL
        A             = LibGLFW::KEY_A
        B             = LibGLFW::KEY_B
        C             = LibGLFW::KEY_C
        D             = LibGLFW::KEY_D
        E             = LibGLFW::KEY_E
        F             = LibGLFW::KEY_F
        G             = LibGLFW::KEY_G
        H             = LibGLFW::KEY_H
        I             = LibGLFW::KEY_I
        J             = LibGLFW::KEY_J
        K             = LibGLFW::KEY_K
        L             = LibGLFW::KEY_L
        M             = LibGLFW::KEY_M
        N             = LibGLFW::KEY_N
        O             = LibGLFW::KEY_O
        P             = LibGLFW::KEY_P
        Q             = LibGLFW::KEY_Q
        R             = LibGLFW::KEY_R
        S             = LibGLFW::KEY_S
        T             = LibGLFW::KEY_T
        U             = LibGLFW::KEY_U
        V             = LibGLFW::KEY_V
        W             = LibGLFW::KEY_W
        X             = LibGLFW::KEY_X
        Y             = LibGLFW::KEY_Y
        Z             = LibGLFW::KEY_Z
        LeftBracket   = LibGLFW::KEY_LEFT_BRACKET
        Backslash     = LibGLFW::KEY_BACKSLASH
        RightBracket  = LibGLFW::KEY_RIGHT_BRACKET
        GraveAccent   = LibGLFW::KEY_GRAVE_ACCENT
        World1        = LibGLFW::KEY_WORLD_1
        World2        = LibGLFW::KEY_WORLD_2
        Escape        = LibGLFW::KEY_ESCAPE
        Enter         = LibGLFW::KEY_ENTER
        Tab           = LibGLFW::KEY_TAB
        Backspace     = LibGLFW::KEY_BACKSPACE
        Insert        = LibGLFW::KEY_INSERT
        Delete        = LibGLFW::KEY_DELETE
        Right         = LibGLFW::KEY_RIGHT
        Left          = LibGLFW::KEY_LEFT
        Down          = LibGLFW::KEY_DOWN
        Up            = LibGLFW::KEY_UP
        PageUp        = LibGLFW::KEY_PAGE_UP
        PageDown      = LibGLFW::KEY_PAGE_DOWN
        Home          = LibGLFW::KEY_HOME
        End           = LibGLFW::KEY_END
        CapsLock      = LibGLFW::KEY_CAPS_LOCK
        ScrollLock    = LibGLFW::KEY_SCROLL_LOCK
        NumLock       = LibGLFW::KEY_NUM_LOCK
        PrintScreen   = LibGLFW::KEY_PRINT_SCREEN
        Pause         = LibGLFW::KEY_PAUSE
        F1            = LibGLFW::KEY_F1
        F2            = LibGLFW::KEY_F2
        F3            = LibGLFW::KEY_F3
        F4            = LibGLFW::KEY_F4
        F5            = LibGLFW::KEY_F5
        F6            = LibGLFW::KEY_F6
        F7            = LibGLFW::KEY_F7
        F8            = LibGLFW::KEY_F8
        F9            = LibGLFW::KEY_F9
        F10           = LibGLFW::KEY_F10
        F11           = LibGLFW::KEY_F11
        F12           = LibGLFW::KEY_F12
        F13           = LibGLFW::KEY_F13
        F14           = LibGLFW::KEY_F14
        F15           = LibGLFW::KEY_F15
        F16           = LibGLFW::KEY_F16
        F17           = LibGLFW::KEY_F17
        F18           = LibGLFW::KEY_F18
        F19           = LibGLFW::KEY_F19
        F20           = LibGLFW::KEY_F20
        F21           = LibGLFW::KEY_F21
        F22           = LibGLFW::KEY_F22
        F23           = LibGLFW::KEY_F23
        F24           = LibGLFW::KEY_F24
        F25           = LibGLFW::KEY_F25
        KP0           = LibGLFW::KEY_KP_0
        KP1           = LibGLFW::KEY_KP_1
        KP2           = LibGLFW::KEY_KP_2
        KP3           = LibGLFW::KEY_KP_3
        KP4           = LibGLFW::KEY_KP_4
        KP5           = LibGLFW::KEY_KP_5
        KP6           = LibGLFW::KEY_KP_6
        KP7           = LibGLFW::KEY_KP_7
        KP8           = LibGLFW::KEY_KP_8
        KP9           = LibGLFW::KEY_KP_9
        KPDecimal     = LibGLFW::KEY_KP_DECIMAL
        KPDivide      = LibGLFW::KEY_KP_DIVIDE
        KPMultiply    = LibGLFW::KEY_KP_MULTIPLY
        KPSubtract    = LibGLFW::KEY_KP_SUBTRACT
        KPAdd         = LibGLFW::KEY_KP_ADD
        KPEnter       = LibGLFW::KEY_KP_ENTER
        KPEqual       = LibGLFW::KEY_KP_EQUAL
        LeftShift     = LibGLFW::KEY_LEFT_SHIFT
        LeftControl   = LibGLFW::KEY_LEFT_CONTROL
        LeftAlt       = LibGLFW::KEY_LEFT_ALT
        LeftSuper     = LibGLFW::KEY_LEFT_SUPER
        RightShift    = LibGLFW::KEY_RIGHT_SHIFT
        RightControl  = LibGLFW::KEY_RIGHT_CONTROL
        RightAlt      = LibGLFW::KEY_RIGHT_ALT
        RightSuper    = LibGLFW::KEY_RIGHT_SUPER
        Menu          = LibGLFW::KEY_MENU
        Last          = LibGLFW::KEY_LAST
        ModShift      = LibGLFW::MOD_SHIFT
        ModAlt        = LibGLFW::MOD_ALT
        ModControl    = LibGLFW::MOD_CONTROL
        ModSuper      = LibGLFW::MOD_SUPER
    end

    ####################################################################
    # mouse buttons enum
    # inspiration: CrystGLFW enum type on https://github.com/calebuharrison/CrystGLFW
    enum MouseButton
        One     = LibGLFW::MOUSE_BUTTON_1
        Two     = LibGLFW::MOUSE_BUTTON_2
        Three   = LibGLFW::MOUSE_BUTTON_3
        Four    = LibGLFW::MOUSE_BUTTON_4
        Five    = LibGLFW::MOUSE_BUTTON_5
        Six     = LibGLFW::MOUSE_BUTTON_6
        Seven   = LibGLFW::MOUSE_BUTTON_7
        Eight   = LibGLFW::MOUSE_BUTTON_8
        Last    = LibGLFW::MOUSE_BUTTON_LAST
        Left    = LibGLFW::MOUSE_BUTTON_LEFT
        Right   = LibGLFW::MOUSE_BUTTON_RIGHT
        Middle  = LibGLFW::MOUSE_BUTTON_MIDDLE
    end

end
