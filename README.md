# Redmine Wiki Notes Plugin

## Plugin installation

1. Copy the plugin directory into the vendor/plugins directory

2. Update your gems

3. Restart Redmine

## Usage

The following macros are added:

- note
- tip
- important
- warning

Which can be used in three ways:

~~~
{{note(Note with *wiki formatting*)}}

{{note
Alternately, you can put blocks of *wiki-formatted* text here.
}}

{{note(Or if you really want)
You can do both...
}}

{{tip
This is a tip
}}

{{warning
Be carefull with :
* razors
* knifes
* fire
}}

{{important
This is important message. Heed my words.
}}
~~~

![Screenshot](screenshot.png?raw=true "Screenshot")

## Credits

The icons and the stylesheet were taken from the DokuWiki Note-Plugin (&copy; Olivier
Cortès and others, https://www.dokuwiki.org/plugin:note (GPLv2)).

For the contributors, please see the git commit log.

## License

This plugin is released under the GPLv2.

