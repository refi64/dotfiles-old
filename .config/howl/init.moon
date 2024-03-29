import app, command, config, mode from howl
import File from howl.io

ffi = require 'ffi'
ffi.cdef [[
  int execvp(const char *file, const char *const argv[]);
]]

-- config.font = 'RobotoMono Nerd Font'
-- config.font = 'FiraCode Nerd Font'
config.font = 'JetBrainsMono Nerd Font Mono'
config.font_size = 10
config.inspectors_on_idle = ''
config.theme = 'Miku Dark'
config.cleanup_close_buffers_after = 99999

mode.configure 'python',
  indent: 4

mode.configure 'ruby',
  inspectors_on_idle: ''

mode.register
  name: 'crystal'
  extensions: {'cr'}
  parent: 'ruby'
  create: -> {}

mode.register
  name: 'meson'
  patterns: { 'meson.build', 'meson_options.txt' }
  parent: 'python'
  create: -> {}

mode.register
  name: 'vue'
  extensions: {'vue'}
  parent: 'html'
  create: -> {}

mode.register
  name: 'bazel'
  extensions: {'bazel', 'bzl', 'BUILD'}
  patterns: { 'BUILD$', 'WORKSPACE$' }
  parent: 'python'
  create: -> {}

mode.register
  name: 'gn'
  extensions: {'gn', 'gni'}
  patterns: { '.gn$' }
  parent: 'python'
  create: -> {}

mode.register
  name: 'PKGBUILD'
  patterns: { '^PKGBUILD$' }
  parent: 'bash'
  create: -> {}

mode.configure 'bazel',
  indent: 2

command.register
  name: 'open-settings'
  description: 'Open init.moon'
  handler: ->
    for ext in *{ 'moon', 'lua' }
      file = app.settings.dir / "init.#{ext}"
      if file.exists
        app\open_file file
        break

      app\open_file app.settings.dir / 'init.moon'

command.register
  name: 'editor-restart'
  description: 'Restart Howl'
  handler: ->
    cmdline = File('/proc/self/cmdline')\read!
    argv = [part for part in cmdline\gmatch '[^%z]+']
    c_argv = ffi.new 'const char*[?]', #argv+1, argv
    c_argv[#argv] = nil
    ffi.C.execvp c_argv[0], c_argv

command.alias 'editor-restart', 'r'
