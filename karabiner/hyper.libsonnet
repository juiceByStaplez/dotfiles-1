/* Generate karabiner.json
*
*  jsonnet hyper.jsonnet -o hyper.json
*  or
*  make karabiner
*
*/

# Mapped to CapsLock below
local ultraMods = [
    "left_control",
    "left_shift",
    "left_option"
];

# CapsLock + Cmd
local hyperMods = [
    "left_control",
    "left_shift",
    "left_option",
    "left_command"
];

local bind(modifier, from_key_code, to_key_code, to_key_mods=null) = {
    from: {
        key_code: from_key_code,
        modifiers: {
            mandatory: modifier
        }
    },
    to: [
        {
            key_code: to_key_code,
            [if to_key_mods != null then "modifiers"]: to_key_mods
        },
    ],
    type: "basic"
};

local ultra(from_key_code, to_key_code, to_key_mods=null) = bind(ultraMods, from_key_code, to_key_code, to_key_mods);
local hyper(from_key_code, to_key_code, to_key_mods=null) = bind(hyperMods, from_key_code, to_key_code, to_key_mods);

[
    {
        "description": "Change caps_lock to command+control+option+shift",
        "manipulators": [
            {
                "from": {
                    "key_code": "caps_lock",
                    "modifiers": {
                        "optional": [
                            "any"
                        ]
                    }
                },
                "to": [
                    {
                        "key_code": "left_shift",
                        "modifiers": [
                            "left_control",
                            "left_option"
                        ]
                    }
                ],
                "to_if_alone": [
                    {
                        "key_code": "escape"
                    }
                ],
                "type": "basic"
            }
        ]
    },
    {
        "description": "Ultra Directional Bindings",
        "manipulators": [
            // Arrows
            ultra("h", "left_arrow"),
            ultra("j", "down_arrow"),
            ultra("k", "up_arrow"),
            ultra("l", "right_arrow"),

            // Arrows + Shift
            hyper("h", "left_arrow", ["left_shift"]),
            hyper("j", "down_arrow", ["left_shift"]),
            hyper("k", "up_arrow", ["left_shift"]),
            hyper("l", "right_arrow", ["left_shift"]),

            ultra("n", "left_arrow", ["left_command"]), // Home
            ultra("p", "right_arrow", ["left_command"]), // End
            ultra("m", "left_arrow", ["left_option"]), // Left one word
            ultra("period", "right_arrow", ["left_option"]), // Right one word

            hyper("n", "left_arrow", ["left_command", "left_shift"]), // Home + Shift
            hyper("p", "right_arrow", ["left_command", "left_shift"]), // End + Shift
            hyper("m", "left_arrow", ["left_option", "left_shift"]), // Left one word + Shift
            hyper("period", "right_arrow", ["left_option", "left_shift"]), // Right one word + Shift

            ultra("u", "page_down"),
            ultra("i", "page_up"),
            hyper("u", "down_arrow", ["left_command"]), // End of page
            hyper("i", "up_arrow", ["left_command"]), // Top of page
        ]
    },
    {
        "description": "Ultra Remaps (forward delete, spaces, mission control)",
        "manipulators": [
            ultra("delete_or_backspace", "delete_forward"), // Forward delete
            hyper("delete_or_backspace", "delete_forward", ["fn", "left_option"]), // Forward delete word
            ultra("a", "left_arrow", ["left_control"]),  // Spaces left
            ultra("d", "right_arrow", ["left_control"]), // Spaces right

            ultra("s", "mission_control"), // Mission Control
            hyper("s", "down_arrow", ["left_control"]) // App windows
        ]
    }
]
