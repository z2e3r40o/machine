var CMD_SHIFT_CTRL = ['command', 'shift', 'control'];

var CMD_SHIFT_CTRL_h = new Key('h', CMD_SHIFT_CTRL, function() {
    var newFrame = Window.focused().screen().frame();
    newFrame.width /= 2;
    Window.focused().setFrame(newFrame);
});

var CMD_SHIFT_CTRL_l = new Key('l', CMD_SHIFT_CTRL, function() {
    var newFrame = Window.focused().screen().frame();
    newFrame.width /= 2;
    newFrame.x += newFrame.width;
    Window.focused().setFrame(newFrame);
});

var CMD_SHIFT_CTRL_k = new Key('k', CMD_SHIFT_CTRL, function() {
    var newFrame = Window.focused().screen().frame();
    newFrame.height /= 2;
    Window.focused().setFrame(newFrame);
});

var CMD_SHIFT_CTRL_j = new Key('j', CMD_SHIFT_CTRL, function() {
    var newFrame = Window.focused().screen().frame();
    newFrame.height /= 2;
    newFrame.y = newFrame.height;
    Window.focused().setFrame(newFrame);
});

var CMD_SHIFT_CTRL_m = new Key('m', CMD_SHIFT_CTRL, function() {
    Window.focused().maximize();
});
